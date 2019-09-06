#!/bin/bash

if [[ "$1" == "" ]]; then
    pp=B
else
    pp=$1
fi

if [[ "$ORG_PATH" == "" ]]; then
    export ORG_PATH=${PATH}
fi

if [[ "$pp" == "M" ]]; then 
    export PROJ=M
    export MFPROJ=~/mediaflow/v1.6.x
    echo "Switch project to main trunk"
elif [[ "$pp" == "B" ]]; then
    export PROJ=B
    export MFPROJ=~/mediaflow/Boreas
    echo "Switch project to branch"
else
    echo "Unknow project [$pp], should be M or B"
    exit -1
fi

export PS1="[$VIMPROMPT\u@\h \W:${PROJ}]$ "
export CDPATH=.:${MFPROJ}/core/backyard:${MFPROJ}/platform:${MFPROJ}/core/borderland:${MFPROJ}/core/backyard/forest/utest:${MFPROJ}/core/backyard/great:${MFPROJ}:${MFPROJ}/build:${MFPROJ}/build/staging/proprietary

#export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:/lib64/pkgconfig
export PATH=${ORG_PATH}:${MFPROJ}/build/staging/proprietary/bin
