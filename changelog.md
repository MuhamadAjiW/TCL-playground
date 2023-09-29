# Changelog

All notable changes to this project should be documented in this file.

## `Sister21` - 2023-09-18 (by MuhamadAjiW, akbarmridho)
### Added
- Compiled and added gdb binary file with python compatibility, check repo at [source](https://github.com/MuhamadAjiW/TCL-gdb-py). Download necessary files at release.
- Added peda extension to gdb
- File injection functionality with `inject.txt`
- Script `build.sh` to simplify building process
- Password mechanism
- Neofetch (Why? Why not?)
- Bash, also set default shell to bash

### Changed
- Updated TCL version into TCL 13.x
- Edited `readme.md` to include more details

### Notes
- gdb is very heavy (at `72.1MB`!)
- in case you don't need it, `delete or comment the lines under # <GDB> comment` and delete the [folder](labsister-module/usr/local/lib/lab_sister/gdb/)
- In case you need it, check out the repo at [source](https://github.com/MuhamadAjiW/TCL-gdb-py).
