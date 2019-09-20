ls -al .bashrc

if [ -f .bashrc ]; then
    echo "Please remove the .bashrc before setting up all the dot file"
#    exit 1
fi

ln -sf script/.bashrc .bashrc
ln -sf script/.gitignore .gitignore
ln -sf script/.gdbinit .gdbinit
ln -sf script/.gitconfig .gitconfig
ln -sf .vim/.ctags .ctags
ln -sf script/.agignore .agignore
ln -sf script/.ackrc .ackrc

ls -al .bashrc
