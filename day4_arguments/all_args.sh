#!/bin/bash

# this script prints all arguments

echo "Total arguments: $#"

for arg in "$@"
do	
	echo "Argument: $arg"
done
