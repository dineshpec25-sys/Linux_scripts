#!/bin/bash

echo -n "Enter the elements of the array : "
read element
rev=$element

count=0
while [ $element -ne 0 ]
do
	echo -n "Enter the elements : "
	read arr[$count]
	count=$((count+1))
	element=$((element-1))
done

while [ $rev -ne -1 ]
do
	rev_arr[element]=${arr[rev]}
	element=$((element+1))
	rev=$((rev-1))
done

echo "${rev_arr[@]}"
