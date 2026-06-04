#!/bin/bash

echo -n "Enter the elements of the array : "
read size

index=0
while [ $size -ne 0 ]
do
	echo -n "Enter the element : "
	read arr[$index]
	index=$((index+1))
	size=$((size-1))
done

while [ $size -lt $index ]
do
	if [ $((arr[$size]%2)) -eq 0 ]
	then
		echo -n "${arr[$size]} "
	fi

	size=$((size+1))
done
