#!/bin/bash

count=0

while [ $count -lt 21 ]
do
	if [ $((count%2)) -eq 0 ]
	then

	else
		echo "$count"
	fi
	count=$((count+1))
done
