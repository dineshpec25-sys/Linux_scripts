#!/bin/bash

for i in {0..4}
do
	echo -n "Enter the elements : "
	read arr[$i]
done  #To get value and store it in array

found=0
echo -n "Enter the value to get the index number : "
read target
for i in {0..4}
do
	if [ ${arr[$i]} -eq $target ]
	then
		echo "The index is $i "
		found=1
		break
	fi
done

if [ $found -eq 0 ]
then
	echo "Target not found!!!"
fi

