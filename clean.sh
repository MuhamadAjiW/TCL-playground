#!/bin/bash
# lupa diexport bruh -amer
. "./vars.sh"

# delete grader/handout skel
ls_module="$(pwd)/labsister-module/usr/local/lib/lab_sister"
sudo rm -rf build "${INJECT_FOLDER}" "${MODULE_FOLDER}" "${LABSIS_INITRD_NAME}.gz" "${OUTPUT_ISO_FILENAME}.iso" "${BASE_ISO_FILE}" "${OUTPUT_ISO_FILENAME}.zip"
sudo rm -rf "${ls_module}/grader"
sudo rm -rf "${ls_module}/handout/skel"
