#!/usr/bin/bash

################################## 1. Input  #################################
# method: 1 (Pos. parameter)

UserName=$1


if [[ -z "${UserName}" ]]; then
    echo "please enter user name"
    exit
fi

string="hello ${UserName}"


echo "${string}"