#!/bin/bash

ls_module="$(pwd)/labsister-module/usr/local/lib/lab_sister"
sudo rm -rf "${ls_module}/grader"
sudo mkdir "${ls_module}/grader"
sudo rm -rf "${ls_module}/handout/skel"
sudo mkdir "${ls_module}/handout/skel"
sudo cp -rf "$(pwd)/datalab-handout/"* "${ls_module}/grader/"
sudo cp -rf "${ls_module}/grader/bits.c" "${ls_module}/handout/skel/bits.c"
sudo chmod a+x "${ls_module}/grader/dlc"
