#!/bin/bash

# this script check disks which has usage more than 50% 

df -h | awk 'NR>1 {print $1,$5}'| while read disk use

do
       usage=${use%\%}
       if [ "$usage" -gt 50 ]; then
	       echo "Warning: $disk is ${usage}% full"
       fi
done       
