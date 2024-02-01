#!/bin/bash

read -p "Enter number of characters: " length

if ! [[ $length -gt 7 ]]; then
    echo "Number of character must be >= 8"
    exit 1
fi

# 
lc=({a..z})
uc=({A..Z})
num=({0..9})
sc=("!" "@" "$")

# 
str=""

# 
str+=${lc[$RANDOM % ${#lc[@]}]}
str+=${uc[$RANDOM % ${#uc[@]}]}
str+=${num[$RANDOM % ${#num[@]}]}
str+=${sc[$RANDOM % ${#sc[@]}]}

#
while [ ${#str} -lt $length ]; do
    char=("${lc[@]}" "${uc[@]}" "${num[@]}" "${sc[@]}")
    str+=${char[$RANDOM % ${#char[@]}]}
done

# 
passwd=$(echo "$str"| tr -d '\n')

echo "$passwd"

