#!/usr/bin/bash

Num1=$1
Num2=$2

if [[ -z "${Num1}" ]]; then
    echo "please Enter two numbers"
    exit 1
fi

if [[ -z "${Num2}" ]]; then
    echo "please Enter the second number"
    exit 1
fi

# Ensure both arguments are integers
if ! [[ "${Num1}" =~ ^-?[0-9]+$ ]]; then
    echo "Error: The first argument '${Num1}' is not a valid integer."
    exit 1
fi

if ! [[ "${Num2}" =~ ^-?[0-9]+$ ]]; then
    echo "Error: The second argument '${Num2}' is not a valid integer."
    exit 1
fi


Res=$((Num1+$Num2))

echo "Sum = ${Res}"