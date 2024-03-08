# Package manager services install

# - [ ]  Have option for full or light install?

# ---  installation_prereqs ---

notif "Installing installation prereqs..."

eval "$update"
eval "$installer curl git"

BASEDIR=$PWD

if [ ! -d "/home/${USER}/.config/" ]
then
	mkdir /home/${USER}/.config
fi

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
cd $BASEDIR

# --- zsh ---

notif "Installing zsh..."

eval "$installer zsh" 

chsh -s /bin/zsh $USER

# --- ohmyzsh ---
# this will require user input

notif "Installing ohmyzsh (user input required)..."

#2 > zsh # dont know if I need to create a default zshrc
#mv ~/.zshrc ~/.zshrc.old

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

cp "${BASEDIR}/${DATA_ROOT}zshrc" /home/${USER}/.zshrc > log.txt

# --- login ---

notif "Cloning into login-message-script..."

cd /tmp/solarOSbuild
git clone https://github.com/n-e-r-k/login-message-script
cp "${BASEDIR}/${DATA_ROOT}config.py" /tmp/solarOSbuild/login-message-script/login/ 
cd /tmp/solarOSbuild/login-message-script/

notif "Starting install script for zsh..."
sh /tmp/solarOSbuild/login-message-script/install/install_zsh.sh

# --- daemons ---

notif "Installing system utils..."

eval "$installer xserver-xorg avahi-daemon fuse"

# --- wm ---

notif "Installing windows managers (icewm, awesome)..."

# -- IceCDE

eval "$installer icewm awesome"

if [ ! -d "/home/${USER}/.config/icewm/" ]
then
	mkdir /home/${USER}/.config/icewm/
fi

cp -r "${BASEDIR}/${DATA_ROOT}nerkSolar/" /home/${USER}/.config/icewm/

# --- terminal ---

notif "Installing terminal software (xterm, kitty)..."

eval "$installer xterm kitty"

# --- user_space ---

notif "Installing userspace programs (i.e., file manager, media player, etc)..."

eval "$installer nmap vlc thunar lua htop"

# --- nvim ---

notif "Installing nvim..."

eval "$installer neovim"

cp -r "${BASEDIR}/${DATA_ROOT}nvim/" /home/${USER}/.config/ > log.txt

mkdir -p ~/.vim/pack/tpope/start
cd ~/.vim/pack/tpope/start
git clone https://tpope.io/vim/sensible.git

# https://github.com/folke/lazy.nvim