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

function selectModules ()
{
    modules=(./src/modules/*.sh)
    result=()

    for file in "${modules[@]}"
    do
        file_without_extension="${file%.sh}"
        notif "Would you like to enable module $file_without_extension (y/n):"
        read USER_INP

        if [[ $USER_INP == "y" ]] || [[ $USER_INP == "Y" ]]
        then
            result+=(true)
        else
            result+=(false)
        fi
    done

    for ((i=0; i < ${#modules}; i++))
    do
        result=${result[i]}
        if [[ result -eq true ]]
        then
            module=${modules[i]}
            source "./src/modules/${module}"
        fi
    done
}