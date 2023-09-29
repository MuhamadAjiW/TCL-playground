#!/bin/bash
# by suggoitanoshi, 18/09/2021
# modified by amer, 20/09/2022

# config
. "./vars.sh"

# setup directories
echo "Setup..."
rdir="$(pwd)"
tmp="$rdir/build"
basedir="$rdir/base"
if [ ! -d "$tmp" ]; then mkdir -p "$tmp"; fi
if [ ! -d "$basedir" ]; then mkdir -p "$basedir"; fi

# mount iso
sudo mount -o loop,ro "$BASE_ISO_FILE" "$basedir"

# copy base boot files
echo "Copying base boot files..."
cp -r "$basedir"/* "$tmp/"

# make sister initrd
echo "Making ${LABSIS_INITRD_NAME}.gz..."
cd "$rdir/${LABSIS_INITRD_FOLDER}"
sudo find | sudo cpio -o -H newc | gzip -2 > "$rdir/${LABSIS_INITRD_NAME}.gz"
cd "$rdir"
advdef -z4 "$rdir/${LABSIS_INITRD_NAME}.gz"
sudo cp -f "$rdir/${LABSIS_INITRD_NAME}.gz" "$tmp/boot/${LABSIS_INITRD_NAME}.gz"

# make labsister module
echo "Making ${LABSIS_MODULE_NAME}.tcz..."
sudo mksquashfs "$rdir/${LABSIS_MODULE_FOLDER}" "$rdir/modules/${LABSIS_MODULE_NAME}.tcz" -noappend -b 4k -no-xattrs

# include extensions
echo "Including extensions..."
if [ -d "$rdir/modules" ]; then
  mkdir -p "$tmp/cde/optional"
  sudo find "$rdir/modules" -maxdepth 1 -type f -printf "%f\n" -exec\
	sh -c "m=\$(basename \"{}\"); if [ ! -f \"$tmp/cde/optional/\$m\" ]; then cp \"$rdir/modules/\$m\" \"$tmp/cde/optional/\$m\" && echo \"\$m\" >> \"$tmp/cde/onboot.lst\"; fi" \;
fi

# change permissions
echo "Changing permissions..."
sudo chmod -R 755 "$tmp"/*

# change initrd
ISOLINUX_DIR="${tmp}/boot/isolinux"
ISOLINUX_CFG="${ISOLINUX_DIR}/isolinux.cfg"
echo "Changing initrd..."
sed -i '/^\tinitrd/ s/$/,\/boot\/'"${LABSIS_INITRD_NAME}"'.gz/g' "${ISOLINUX_CFG}"

# change boot opts
echo "Changing boot opts..."
sed -i "s/append/append cde vga=791/g" "${ISOLINUX_CFG}"

# disable prompt
echo "Disabling prompt..."
sed -i "s/prompt 1/prompt 0/" "${ISOLINUX_CFG}"
echo "" > "${ISOLINUX_DIR}/boot.msg" # remove tinycore welcome message

# change owner
echo "Changing owner..."
sudo chown -R root:root "$tmp"/*

# make ISO
echo "Making iso..."
sudo mkisofs -l -J -r -V "$VOLUME_NAME" -no-emul-boot \
	-boot-load-size 4 \
	-boot-info-table -b boot/isolinux/isolinux.bin \
	-c boot/isolinux/boot.cat -o "${OUTPUT_ISO_FILENAME}.iso" "$tmp"

# zip iso
echo "Zipping iso..."
7z a -tzip "${OUTPUT_ISO_FILENAME}.zip" "${OUTPUT_ISO_FILENAME}.iso"


# cleanup
echo "Unmounting iso..."
sudo umount -r "$basedir"

echo "Removing unused directories..."
sudo rm -rf "$basedir"
sudo rm -rf "$tmp"
