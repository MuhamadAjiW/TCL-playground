# lab-config.sh by nieltg, Daniel

LAB="lab_sister"

LAB_LIB="/usr/local/lib/${LAB}"
LAB_LIB_INIT="${LAB_LIB}/init"
LAB_LIB_SETUID_HELPER_SRC="${LAB_LIB}/setuid.c"

LAB_LIB_HANDOUT="${LAB_LIB}/handout"
LAB_LIB_HANDOUT_INIT="${LAB_LIB_HANDOUT}/init"
LAB_LIB_HANDOUT_SKEL="${LAB_LIB_HANDOUT}/skel"
LAB_LIB_HANDOUT_PROFILE_APPEND_SRC="${LAB_LIB_HANDOUT}/profile-append.sh"

LAB_LIB_GRADER="${LAB_LIB}/grader"

LAB_VAR="/var/lib/${LAB}"
LAB_VAR_SETUID_HELPER="${LAB_VAR}/setuid-helper"
LAB_VAR_USERNAME="${LAB_VAR}/username"
LAB_VAR_TMP="${LAB_VAR}/tmp"
LAB_PASSWORD_ENDPOINT="http://sister21.tech/api/static/bin"