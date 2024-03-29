# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
if [ "$ORG_PATH" == "" ]; then
	export ORG_PATH=$PATH
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -f ~/script/.bash_aliases ]; then
	. ~/script/.bash_aliases
fi


# $- indicate the set option in current shell
# Only interactive mode shell will disable ixon for vim using Ctrl-S
# set option can be 'himBH'. 
# [[ $- == *i* ]] && stty -ixon

#export CLICOLOR=1
#export LSCOLORS=ExFxBxDxCxegedabagacad
LS_COLORS="no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:*.c=00;33:*.cc=00;33:*.cpp=00;33:*.h=00;32:"
export LS_COLORS
export DISPLAY=:0.0
alias vi=vim
alias ls='ls --color=auto'

[ -f ~/script/git-completion.bash ] && source ~/script/git-completion.bash
[ -f /etc/default/locale ] && source /etc/default/locale

#[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# source devtoolset-7
#which scl_source > /dev/null 2>&1 && source scl_source enable devtoolset-7

