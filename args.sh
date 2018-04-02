#!/bin/bash

echo number of arguments is $#
i=0
for var in "$@"
do
    echo ${i}:["$var"]
    let i++
done

