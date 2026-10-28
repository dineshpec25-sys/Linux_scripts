#!/bin/bash

while true
do	
	echo -ne "CPU Temperature : "
	sensors | awk 'NR == 7'	| awk '{print $2}'
	sleep 1
	clear
done
