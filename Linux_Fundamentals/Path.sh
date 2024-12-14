#!/usr/bin/bash

file_path=$1
if [[ -z "${file_path}" ]]; then
    echo "please enter path of the file"
    exit
fi

if [ ! -f "${file_path}" ]; then
    echo "File \"${file_path}\" Not exists"
    exit
fi

file="${file_path##*/}"

fileName="${file%%.*}"
ext="${file#*.}"


echo "file name is ${fileName}"
echo "file ext is ${ext}"
