#!/bin/bash

function show_help()
{
    echo "[Usage] nopwd.sh [<username>@]<remotesite>"
    echo 'e.g. '
    echo '$./nopwd.sh v7000'
    echo '$./nopwd.sh jedywei@v7000'
    echo
    exit -1
}

if [[ $#  < 1 ]]; then
    show_help
fi

url="$1"
usr_at_site="^([^@]*)@([^[:space:]]*)$"
if [[ "$url" =~ $usr_at_site ]]; then
    username="${BASH_REMATCH[1]}"
    site="${BASH_REMATCH[2]}"
elif [[ "$url" != "" ]]; then
    username="jedywei"
    site="$url"
fi

if [[ "$username" == "" || "$site" == "" ]]; then
    echo [Error] No username or sitename
    show_help
fi


echo "Make no password login to ${username}@{$site} by ssh"

#
# check id_rsa.pub
#

if [[ ! -f ~/.ssh/id_rsa.pub ]]; then
   echo use command as following to generate ssh key pairs 
   echo $ssh-keygen -t rsa -C ${username}
fi


# remove the site from .ssh/known_hosts
# get ipaddr by $site (remote site)
ipaddr=""
pingres="$(ping -a $site -c 1)"
ipaddr_pat="^.*\(([[:digit:]]{1,3})\.([[:digit:]]{1,3})\.([[:digit:]]{1,3})\.([[:digit:]]{1,3})\)"
if [[ "$pingres" =~ $ipaddr_pat ]]; then
    ipaddr_pat="/^.*${BASH_REMATCH[1]}\\.${BASH_REMATCH[2]}\\.${BASH_REMATCH[3]}\\.${BASH_REMATCH[4]}.*$/d"
    ipaddr="${BASH_REMATCH[1]}.${BASH_REMATCH[2]}.${BASH_REMATCH[3]}.${BASH_REMATCH[4]}"
fi

echo the host $site IP address is $ipaddr
echo ipaddr_pat=$ipaddr_pat
# delete ipaddr from ~/.ssh/known_hosts
sed -i.bak $ipaddr_pat ~/.ssh/known_hosts

function print_res()
{
    if [[ $1 == 0 ]]; then
        echo "Succeed to setup no password for ssh"
    else
        echo "Failed"
        exit -1
    fi
    exit 0
}

ssh ${username}@${site} mkdir -p .ssh
[[ $? != 0 ]] && print_res -1 
cat ~/.ssh/id_rsa.pub | ssh ${username}@${site} 'cat >> ~/.ssh/authorized_keys'
[[ $? != 0 ]] && print_res -1
ssh ${username}@${site} "chmod 700 .ssh; chmod  640 ~/.ssh/authorized_keys"
[[ $? != 0 ]] && print_res -1

ssh ${username}@${site} "ls -al" > /dev/null
print_res $? 
##
#  if not rsa key pair
#  command as
#  $ssh-keygen -t rsa
#  <press enter key> for no passwd
