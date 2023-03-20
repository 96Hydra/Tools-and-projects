#!/usr/bin/bash
#Variables
empty=""
#Args for script 

while [ "$1" != ""]; do
        case "$1" in 
        -i | --ip )		ip="$2";	shift;;
		-p | --ports )		ports="$2";	shift;;
        esac
        shift 

done 

#Checking if the -i is empy 

if [[ $ip == $empty]]; then 
        echo "Put an IP address in here dummy with a -i"
        exit
fi 

#Scans ports and displays open ports
for i in $(seq 1 $ports); do 
        ( echo > /dev/tcp/$ip/$i) > /dev/null 2&1 && echo $ip": "$i "is open for business";

done 