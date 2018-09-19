#!/bin/bash

# install vim
# apt-get install vim
# On CentOS
# yum install vim-enhanced

# install bundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

# install curl
# apt-get install curl

# install .vimrc
cp ~/vimpack/vimrc ~/.vimrc

# install PaperColor
mkdir -p ~/.vim/colors
cp ~/vimpack/PaperColor.vim ~/.vim/colors

