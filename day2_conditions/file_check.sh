#!/bin/bash

FILE="/etc/passwd"

if [ -f $FILE ]; then
	echo "File $FILE exists"
else
        echo "File $FILE doesn't exist"
fi	
