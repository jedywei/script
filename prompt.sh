#!/bin/bash
# terminal escapes should be surrounded by \[ and \] in order for bask to be able to correctly count printing characters to the 
# beginning of line. 
export PS1="[$VIMPROMPT\[\e[38;5;118m\]\u@\h\[\e[00m\] \W:${PROJ}]$ \[\e]0;@\h:\W\007\]"
