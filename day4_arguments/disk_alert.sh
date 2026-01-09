#!/bin/bash

# this script accept threshold as an argument and prints the filesystem that exceeds that threshold

THRESHOLD=$1

if [ -z "$THRESHOLD" ]; then
	echo "Usage: $0 <threshold-value>"
	exit 1
fi

df -h | awk 'NR>1 {print $1,$5}' | while read disk use

do
	usage=${use%\%}
        if [ "$usage" -gt "$THRESHOLD" ]; then
		echo "Warning: $disk is ${usage}% full"
	fi
done	
      
