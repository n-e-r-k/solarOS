#!/bin/bash

# Pre install requirements module

eval "$update"
eval "$installer curl git"

if [ ! -d "/home/${USER}/.config/" ]
then
	mkdir /home/${USER}/.config
fi

# Move fonts
mkdir /usr/share/fonts/3270
cp ./data/3270/*.ttf /usr/share/fonts/3270