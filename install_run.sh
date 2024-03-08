#!/bin/bash

# --- definitions ---

SRC_ROOT="./src/"
DATA_ROOT="./data/"

# --- config ---

# grab external functions and variables

source "${SRC_ROOT}additional_functions.sh"

# check for input (arg or selection)
# only debian and arch options, as the lord intended

setPackMan

# start install both through package manager and manual install

notif "Starting install of solarOS using $PACKAGE_MANAGER"

source "${SRC_ROOT}services_install.sh"

# install additional install targets

notif "Installing additional install targets"
eval "$installer $INSTALL_TARGETS"