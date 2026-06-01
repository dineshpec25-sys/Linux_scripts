#!/bin/bash

echo -n "Enter the number : "
read N

count=1
while [ $count -le $N ]
do
	if [ $((count%3)) -eq 0 ]
	then
		echo "$count"
	fi
	count=$((count+1))
done
