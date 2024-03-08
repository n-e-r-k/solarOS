function notif () 
{
	echo "[install_run.sh] $1"
}

# only debian and arch options, as the lord intended
function setPackMan ()
{
    if [ "$PACAKGE_MANAGER" == "" ]
    then
        notif "what package manager to use? (apt/pacman)"
        read PACKAGE_MANAGER
    fi

    if [ "$PACKAGE_MANAGER" == "apt" ]
    then
        update="sudo apt update && sudo apt -y upgrade"
        installer="sudo apt -y install"
    elif [ "$PACKAGE_MANAGER" == "pacman" ]
    then
        update="sudo pacman -Syu"
        installer="sudo pacman -S"
    else
        notif "ERR: $PACKAGE_MANAGER is not a valid install option."
        exit 1
    fi
}