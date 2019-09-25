#!/bin/bash
# Prequisite:
#   git clone .vim and script
# Usage:
#   cd ~
#   script/dotsetup.sh 
#


if [ "$(pwd)" != "${HOME}" ]; then
    echo "Abort!!"
    echo "Please run this setup at home directory!"
    echo 'usage: $cd ~'
    echo '       $script/dotsethup.sh'
    echo ""
    exit 1
fi


if [ -f ~/.dothassetup ]; then
    echo "Abort!!"
    echo "dotsetup.sh has been run before."
    echo "Please 'rm ~/.dothassetup' to enable to run the dtosetup.sh again"
    echo ""
    exit 1
else
    touch .dothassetup
fi

ls -al .bashrc

if [ -f .bashrc ]; then
    echo "-------------------------------------------"
    head -n 20 .bashrc
    echo "....."
    read -r -p "Are you sure to remove current .bashrc? [y/N]" answer
    if [[ ${answer} =~ [yY](es)* ]]; then
        rm .bashrc
    else
        echo "Abort!!"
        echo "User denied installing dotsetup.sh"
        echo ""
        exit 2
    fi
fi

ln -sf script/.bashrc .bashrc
ln -sf script/.gitignore .gitignore
ln -sf script/.gdbinit .gdbinit
ln -sf script/.gitconfig .gitconfig
ln -sf .vim/.ctags .ctags
ln -sf script/.agignore .agignore
ln -sf script/.ackrc .ackrc

ls -al .bashrc

echo "Success to install dotsetup"
echo ""

