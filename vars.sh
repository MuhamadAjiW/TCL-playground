# global config
TINYCORE_VER="14.x" # versi tinycore
VOLUME_NAME="holobit" # nama volume iso
OUTPUT_ISO_FILENAME="orkom" # nama file iso, tanpa ekstensi iso

LABSIS_INITRD_NAME="sisterd" # nama initrd tambahan untuk labsister
LABSIS_INITRD_FOLDER="sister" # folder modul initrd labsister
LABSIS_MODULE_NAME="labsister" # nama extension labsister
LABSIS_MODULE_FOLDER="labsister-module" # folder extension labsister

MODULE_FOLDER="modules"
MODULE_LIST="./modules.txt"
INJECT_FOLDER="./${LABSIS_MODULE_FOLDER}/usr/local/lib/lab_sister/inject"
INJECT_LIST="./inject.txt"

# do not touch
BASE_ISO_FILE="Core-current.iso" # nama iso base, harus pake ekstensi iso
TC_URL="http://tinycorelinux.net/14.x/x86/"

# main link: http://tinycorelinux.net/14.x/x86/
# mirror: https://mirror.math.princeton.edu/pub/tinycorelinux/14.x/x86/