#!/bin/bash

iter=0

for pic in /home/karinasraya/Downloads/nature/*.jpg

do

base64 -d $pic | xxd -r > /home/karinasraya/Downloads/pic/$iter.jpg
iter=$((iter+1))

done
