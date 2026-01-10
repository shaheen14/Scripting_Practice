#!/bin/bash

#this script shows how functions accept argument from command line


func_arg_cmd() {
	local USERNAME=$1
	if [ -z  "$USERNAME" ]; then
	      	echo " Usage: $0 <username>"	
	        return 1
	fi
	echo " Hello $USERNAME"
}
func_arg_cmd "$1"
