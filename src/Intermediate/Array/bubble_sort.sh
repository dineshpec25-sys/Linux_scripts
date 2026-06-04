#!/bin/bash

echo -n "Enter the size of the array : "
read size
loop1=size

i=0
while [ $size -ne 0 ]
do
	echo -n "Elements : "
	read arr[$i]
	i=$((i+1))
	size=$((size-1))
done

i=0
while [ $i -lt $loop1 ]
do
	

