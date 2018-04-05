#!/bin/bash

function find_top {
    if [[ -f $1/scripts/auto_rules.mk ]]; then
        echo $1
    else 
        if [[ "$1" == "/" ]]; then
            echo "Error! Couldn't find auto_rules.mk"
        else
            find_top `realpath $1/..`
        fi
    fi
}


# oled source code for release

#make ; make install

top=$(find_top .)
