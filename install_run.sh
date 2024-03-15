#!/bin/bash

# --- definitions ---

SRC_ROOT="./src/"
MODULE_ROOT="./src/modules/"
DATA_ROOT="./data/"

# --- config ---

# grab external functions and variables

source "${SRC_ROOT}additional_functions.sh"

# check for input (arg or selection)
# only debian and arch options, as the lord intended

setPackMan

# --- Set install type ---

notif "Which type of install?:"
notif "1) Core install (DM,WM,LOGIN,THEME)"
notif "2) Standard install"
notif "3) Full install (Includes optional module [devtools, WMs, etc...])"
notif "4) Custom install"

read USER_INP
if [[ "$USER_INP" == "1" ]]
then
    notif "Starting Core install of solarOS using $PACKAGE_MANAGER"
    source "${MODULE_ROOT}preinstall.sh"
    source "${MODULE_ROOT}core.sh"
    source "${MODULE_ROOT}daemons.sh"
elif [[ "$USER_INP" == "2" ]]
then
    notif "Starting Standard install of solarOS using $PACKAGE_MANAGER"
    source "${MODULE_ROOT}preinstall.sh"
    source "${MODULE_ROOT}core.sh"
    source "${MODULE_ROOT}daemons.sh"
    source "${MODULE_ROOT}programs.sh"
elif [[ "$USER_INP" == "3" ]]
then
    notif "Starting Full install of solarOS using $PACKAGE_MANAGER"
    source "${MODULE_ROOT}preinstall.sh"
    source "${MODULE_ROOT}core.sh"
    echo "PRESS ANY TO CONTINUE"
    read debug_wait_1
    source "${MODULE_ROOT}daemons.sh"
    echo "PRESS ANY TO CONTINUE"
    read debug_wait_2
    source "${MODULE_ROOT}programs.sh"
    echo "PRESS ANY TO CONTINUE"
    read debug_wait_3
    source "${MODULE_ROOT}optional.sh"
elif [[ "$USER_INP" == "4" ]]
then
    notif "Starting Custom install of solarOS using $PACKAGE_MANAGER"
    selectModules
fi