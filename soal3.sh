#!/bin/bash

g_pass=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 12 | head -n 1)

name="password"
num=1

while test -e "$name$num.txt"; do
num=$((num+1))
done

fname= "$name$num.txt"
echo "$g_pass" > $fname
