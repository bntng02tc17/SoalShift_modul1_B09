#!/bin/bash

echo "Masukkan nama file zip tanpa ekstensi!"
read filenama
rot=${filenama:0:2}


datenow=`date +%Y-%m-%d`
timenow=`date +%H:%M`

a=abcdefghijklmnopqrstuvwxyz
b=ABCDEFGHIJKLMNOPQRSTUVWXYZ
rot=`echo $rot|sed 's/^0*//'`
let r=0-$rot

#`sudo cp var/log/backup/"$filenama.zip" ~/"$filenama.zip"`
`unzip ~/backup/"$filenama.zip" -d ~/backup/`

#`sudo cp ~/"$filenama.txt" ~/terdekrip.txt`
#`chmod 777 terdekrip.txt`
`sudo <~/backup/"$filenama.txt"  sed "y/$a$b/${a:$r}${a::$r}${b:$r}${b::$r}/" > ~/backup/terdekrip"$filenama".txt`
#`sudo mv ~/"$filenama.txt" /var/log/backup/decrypted.txt` 
#`sudo rm ~/"$filenama.zip"`
#`zip -j ~/lat/tjn/\$timenow\ \$datenow\decript.zip ~/lat/asl/coba2d.txt`
#`sudo rm coba2d.txt`

