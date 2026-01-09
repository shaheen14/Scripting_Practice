#!/bin/bash

#this is simple script to check whether arguments are provided or not

if [ $# -eq 0 ]; then
	echo "Usage $0 <filename>"
	exit 1
fi

echo "You provided file: $1"
