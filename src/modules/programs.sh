#!/bin/bash

# User programs module

# --- terminals ---

eval "$installer xterm alacritty"

# --- accessories ---

eval "$installer nmap vlc thunar htop firefox-esr tldr notepadqq"

# --- languages ---

eval "$installer lua python3"

# --- Remote Desktop ---

eval "$installer xrdp"

sudo systemctl stop xrdp

# --- nvim ---

eval "$installer neovim"

cp -r "${BASEDIR}/${DATA_ROOT}nvim/" /home/${USER}/.config/ > log.txt