#
if [ "$0" == "${BASH_SOURCE[0]}" ]; then
    echo "Using 'source <projdir>/projenv.sh'"
    echo "   to set up environment variables for mediaflow project"
    exit -2
fi
PROJPATH=$(realpath -s ${BASH_SOURCE[0]})
PROJENV_VERSION="APST@"${PROJPATH}

if [ "${SOURCED_PROJENV}" == "${PROJENV_VERSION}" ]; then
    return
fi

export MFORG_PATH=${PATH} 
export SOURCED_PROJENV=${PROJENV_VERSION}

PROJDIR=$(dirname ${PROJPATH})
PROJNAME=$(basename ${PROJDIR})
echo ${PROJNAME}

export PROJ=${PROJNAME:0:1}
export MFPROJ=${PROJDIR}

export PS1="[$VIMPROMPT\u@\h \W:${PROJ}]$ "
if [ -z $ORGCDPATH ]; then
    export ORGCDPATH=$CDPATH
fi

export CDPATH=.:${ORGCDPATH}:${MFPROJ}

GCC_PATH=~/.local/xPacks/@xpack-dev-tools/arm-none-eabi-gcc/9.2.1-1.1.1/.content/bin
export GCC_PATH
alias python=python3

echo -e "Success to set up ${PROJDIR} as project environment\n"
