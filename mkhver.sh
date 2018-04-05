#  
# @file make a h version file
# @breif bash script manage version
# 
# Copyright (C) 2016 Advantech Co., Ltd. - http://www.advantech.com.tw/ 
#  All Rights Reserved. 
# 
#  NOTICE:  All information contained herein is, and remains the property of  
#    Advantech Co., Ltd. and its suppliers, if any.  The intellectual and  
#    technical concepts contained herein are proprietary to Advantech Co., Ltd. 
#    and its suppliers and may be covered by U.S. and Foreign Patents, 
#    patents in process, and are protected by trade secret or copyright law. 
#    Dissemination of this information or reproduction of this material 
#    is strictly forbidden unless prior written permission is obtained 
#    from Advantech Co., Ltd. 
#  
# @date   2017/06/12      jedy.wei      New File 

#!/bin/bash

function find_top 
{
    input_path=$1
    if [[ -f ${input_path}/scripts/auto_rules.mk ]]; then
        echo ${input_path}
    else
        if [[ "${input_path}" == "/" ]]; then
            echo "Error! Couldn't find auto_rules.mk"
        else
            find_top $(realpath ${input_path}/..)
        fi
    fi
}


function create_hverfile
{
    PROJNAME=$(echo $1 | awk '{print toupper($0)}')
    projname=$(echo $1 | awk '{print tolower($0)}')
#    echo ${PROJNAME}
#    echo ${projname}
    H_FILE=${projname}_version.h
    TARGET_FILE=$3

    if [[ ! -f $2 ]]; then
        echo "$2 is required"
        exit 1
    fi

    VERSION=$(head -n 1 $2)
#    echo VERSION=${VERSION}
    ver_format="^([0-9]*).([0-9]*).([0-9]*)(-[0-9]*)?"
    if [[ ${VERSION} =~ $ver_format ]]; then
        MAJOR_VER=${BASH_REMATCH[1]}
        MINOR_VER=${BASH_REMATCH[2]}
        MICRO_VER=${BASH_REMATCH[3]}
        PATCH_VER=${BASH_REMATCH[4]}
    else
        echo the version format of '${VERSION}' is not correct, should be \"Major.Minor.Micro\", for example 0.87.12
    fi



cat <<EOF > ${TARGET_FILE}
/* DON'T EDIT THIS FILE ${H_FILE}
 * version file is automatically genterated by shell script from VERSION file
 * VERSION : ${VERSION}
 */
#ifndef __${PROJNAME}_VERSION_H
#define __${PROJNAME}_VERSION_H

#ifdef __cplusplus
extern "C" {
#endif

#define ${PROJNAME}_MAJOR_VERSION ${MAJOR_VER}
#define ${PROJNAME}_MINOR_VERSION ${MINOR_VER}
#define ${PROJNAME}_MICRO_VERSION ${MICRO_VER}
#define ${PROJNAME}_BUILD_VERSION ${PATCH_VER}

#ifndef __stringify
#define __stringify_1(x) #x
#define __stringify(x) __stringify_1(x)
#endif 
#define ${PROJNAME}_VERSION __stringify(${PROJNAME}_MAJOR_VERSION)"."__stringify(${PROJNAME}_MINOR_VERSION)"."__stringify(${PROJNAME}_MICRO_VERSION)__stringify(${PROJNAME}_BUILD_VERSION)
#define ${PROJNAME}_VERSION_NUM ((${PROJNAME}_MAJOR_VERSION << 16) | \\
                                (${PROJNAME}_MINOR_VERSION << 8) | \\
                                (${PROJNAME}_MICRO_VERSION))

#define ${projname}_version()         ${PROJNAME}_VERSION
#define ${projname}_version_num()     ${PROJNAME}_VERSION_NUM

#ifdef __cplusplus
}
#endif

#endif /* __${PROJNAME}_VERSION_H */

EOF
    
}

if [[ $# < 2 ]]; then 
    echo $#
    echo "Usage $0 <projname> <version_file> [<target_file>]"
    exit 1
fi

_proj=$1
_verf=$2

if [[ ! ${_verf} =~ ^/.* ]]; then
    _verf="$(pwd)/${_verf}"
fi


if [[ $# < 3 ]]; then 
    _target_file="$(pwd)/${_proj}_vesrion.h"
else
    _target_file="$3"
fi

create_hverfile ${_proj} ${_verf} ${_target_file}

