#!/bin/bash

# CORE (userspace) module
# - Display manager
# - Window manager
# - Shell

BASEDIR=$PWD

echo "BASE DIR IS ${BASEDIR} (Press any key to continue)"
read userhalt

# --- LY ---

notif "Installing LY display manager..."

eval "$installer build-essential libpam0g-dev libxcb-xkb-dev"

mkdir /tmp/solarOSbuild
cd /tmp/solarOSbuild

git clone --recurse-submodules https://github.com/fairyglade/ly
cd ly
make
sudo make install installsystemd
sudo systemctl enable ly.service
sudo systemctl disable getty@tty2.service

cd /tmp/solarOSbuild

# --- zsh ---

notif "Installing zsh..."

eval "$installer zsh" 

chsh -s /bin/zsh $USER

# --- ohmyzsh ---
# this will require user input

notif "Installing ohmyzsh (user input required)..."

#2 > zsh # dont know if I need to create a default zshrc
#mv ~/.zshrc ~/.zshrc.old

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

cp "${BASEDIR}/${DATA_ROOT}zshrc" /home/${USER}/.zshrc

# --- login ---

notif "Cloning into login-message-script..."

cd /tmp/solarOSbuild
git clone https://github.com/n-e-r-k/login-message-script
cp "${BASEDIR}/${DATA_ROOT}config.py" /tmp/solarOSbuild/login-message-script/login/ 
cd /tmp/solarOSbuild/login-message-script/

notif "Starting install script for zsh..."
sh /tmp/solarOSbuild/login-message-script/install/install_zsh.sh

# -- IceCDE ---

eval "$installer icewm"

if [ ! -d "/home/${USER}/.config/icewm/themes" ]
then
	mkdir -p /home/${USER}/.config/icewm/themes
fi

cd /home/${USER}/.config/icewm/themes
git clone https://github.com/n-e-r-k/SolarICE


cd ${BASEDIR}
