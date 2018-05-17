#!/bin/bash

if [[ ${#} == 1 ]]; then
	x=$1
	echo $x no arguments
else if [[ ${#} == 2 ]]; then
		x=$1
		y=$2
		echo $y $x
	else
		echo ERROR there were ${#} arguments
	fi
fi
exit