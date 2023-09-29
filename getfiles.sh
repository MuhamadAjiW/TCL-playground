#!/bin/bash

# config
. "./vars.sh"

# helper
cachemodule(){
	[ -f "${1}/${2}" ] || wget "${TC_URL}/${3}/${2}" -O "${1}/${2}"
}
cachegeneral(){
	[ -f "${1}/${2}" ] || wget "${2}" -P "${1}"
}

# get microcore iso
echo "Getting microcore..."
cachemodule "." "${BASE_ISO_FILE}" "release"

# get modules
echo "Getting necessary modules..."
[ ! -d "${MODULE_FOLDER}" ] && mkdir -p "${MODULE_FOLDER}"
MODULES=$(cat ${MODULE_LIST})
for MOD in ${MODULES}; do
	cachemodule "${MODULE_FOLDER}" "${MOD}" tcz
done

# get other files
echo "Getting misc files..."
[ ! -d "${INEJCT_FOLDER}" ] && mkdir -p "${INJECT_FOLDER}"
INEJCT=$(cat ${INJECT_LIST})
for INJ in ${INEJCT}; do
	cachegeneral "${INJECT_FOLDER}" "${INJ}"
done
