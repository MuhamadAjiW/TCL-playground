# profile-append.sh by nieltg, Daniel
# modified by suggoitanoshi on 18/09/2021

if [ ! -f .nanorc ]
then
cat << 'EOF' > .nanorc
set backup
set smarthome
set smooth
set morespace
set nowrap
set tabsize 4
EOF
fi

# set scoreboard display nickname
export LAB_NICKNAME="$(id -un | cut -c5-)"
export LAB_PASSWORD="$(id -un | cut -c5-)"

setnickname(){
  if [ -z "$1" ]; then export LAB_NICKNAME="$(id -un | cut -c5-)";
  elif grep -qE "[^a-zA-Z0-9_+-]" <<EOF
$1
EOF
  then echo "nickname hanya boleh mengandung karakter alfanumerik!"
  else export LAB_NICKNAME="$1"
  fi
}

setpassword(){
  if [ -z "$1" ]; then export LAB_PASSWORD="$(id -un | cut -c5-)";
  elif grep -qE "[^a-zA-Z0-9_+-]" <<EOF
$1
EOF
  then echo "password hanya boleh mengandung karakter alfanumerik!"
  else export LAB_PASSWORD="$1"
  fi
}
