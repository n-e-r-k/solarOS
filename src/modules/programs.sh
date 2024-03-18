#!/bin/bash

# User programs module

# --- terminals ---

eval "$installer xterm alacritty"

# --- accessories ---

eval "$installer nmap vlc thunar htop firefox-esr tldr"

# --- languages ---

eval "$installer lua python3"

# --- nvim ---

eval "$installer neovim"

cp -r "${BASEDIR}/${DATA_ROOT}nvim/" /home/${USER}/.config/ > log.txt