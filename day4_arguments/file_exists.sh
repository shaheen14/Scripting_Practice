#!/bin/bash

# This script whether file exists or not

FILE=$1

if [ -z "$FILE" ]; then
	echo "Usgae: $0 <file>"
	exit 1
fi

if [ -f "$FILE" ]; then
	echo "File $FILE exists"
else
        echo "File $FILE does not exist"
fi	
