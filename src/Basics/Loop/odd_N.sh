#!/bin/bash

echo -n "Enter the number : "
read N

count=1
while [ $count -lt $N ]
do
	if [ $((count%2)) -ne 0 ]
	then
		echo "$count"
	fi
	count=$((count+1))
done
