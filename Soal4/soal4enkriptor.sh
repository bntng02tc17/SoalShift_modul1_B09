#!/bin/bash

datenow=`date +%d-%m-%Y`
timenow=`date +%H:%M`
rot=`date +"%H"`
a=abcdefghijklmnopqrstuvwxyz
b=ABCDEFGHIJKLMNOPQRSTUVWXYZ
r=$rot
r=`echo $r|sed 's/^0*//'`
#echo $r
na="$timenow $datenow"
`mkdir -p ~/backup`
`sudo </var/log/syslog sed "y/$a$b/${a:$r}${a::$r}${b:$r}${b::$r}/">~/"$na.txt"`
`sudo zip -j ~/backup/"$na.zip" ~/"$na.txt"`
`sudo rm ~/"$na.txt"`

#echo $na
