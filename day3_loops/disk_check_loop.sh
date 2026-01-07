#!/bin/bash

# this script check disk using while loop

df -h | grep -v Filesystem | while read line

do
	echo "$line"
done	
