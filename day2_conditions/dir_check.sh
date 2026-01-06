#!/bin/bash

DIR="/etc"

if [ -d "$DIR" ]; then
	echo "Directory $DIR exists"
else
        echo "Directory $DIR doesn't exist"
fi	
