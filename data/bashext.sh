# TAG:--BEL---
# nerk bash extended:

# --- Functions ---

log () {
    if [[ $# -eq 0 && $# -eq 1 ]]
    then
        echo "log "Message" File"
        echo "e.g., log "Hello World" /home/user/file.txt"
    fi

    local header="[$(date +'%m/%d/%Y')] ~ $USER\n"
    local message=$1

    echo -e "$header$message"
    echo -e "$header$message" >> $2
}

# how to get subnet of host ip. - but also we need subnetworks through linux... so idk+

list_network_hosts () {
    networks_pool=($(ip a | grep -e "inet "))
    networks=()

    for i in "${!networks_pool[@]}"; do
        if [[ ${networks_pool[$i]} =~ "inet" ]]; 
        then 
            networks+=(${networks_pool[$i + 1]})
        fi
    done

    for network in "${networks[@]}"; do
        echo -e "hosts on \u001b[36m$network\u001b[0m:"
        echo -e "\u001b[45m"
        #[[ "$date" =~ ^[0-9]{8}$ ]]
        if [[ $network =~ "127.0.0.1" ]]
        then
            echo "Local Host"
        else
            nmap -sn $network | grep -Eo "([a-z]+.|)[a-z]+.[a-z]+ \([0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}\)"
        fi
        echo -e "\u001b[0m"
    done
}

# --- Alias ---

alias pscan='nmap -T4'
alias hscan='nmap -sn'
alias pnet='nmap -sn 10.10.1.0/24'
alias lnh='list_network_hosts'
alias nkdd='sh /home/nerk/.scr/bashext.sh'

# --- Startup ---

startup () {
    clear
    echo -e "\x1B[2J"
    echo -e "JumpBox - Docker - $(whoami)\n"
    list_network_hosts
}

startup