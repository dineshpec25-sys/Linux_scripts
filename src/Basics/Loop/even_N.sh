#!/bin/bash

echo -n "Enter the Number : "
read N

count=1
while [ $count -le $N ]
do
	if [ $((count%2)) -eq 0 ]
	then
		echo "$count"
	fi
	count=$((count+1))
done
