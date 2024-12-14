#!/usr/bin/bash

# Function to check if the input is a valid integer
is_integer() {
    [[ "$1" =~ ^-?[0-9]+$ ]]
}

# Prompt user for numbers
read -r -p "Enter the first number: " Num1
read -r -p "Enter the second number: " Num2

# Validate inputs
if ! is_integer "$Num1"; then
    echo "Error: The first input '$Num1' is not a valid integer."
    exit 1
fi

if ! is_integer "$Num2"; then
    echo "Error: The second input '$Num2' is not a valid integer."
    exit 1
fi

# Prompt user for the operation
read -r -p "Choose an operation (+, -, *, /): " operation

# Perform the selected operation
case $operation in
    '+')
        Res=$((Num1 + Num2))
        echo "Result: $Num1 + $Num2 = $Res"
        ;;
    '-')
        Res=$((Num1 - Num2))
        echo "Result: $Num1 - $Num2 = $Res"
        ;;
    *)
        echo "Invalid operation. Please enter one of +, -, *, /."
        exit 1
        ;;
esac
