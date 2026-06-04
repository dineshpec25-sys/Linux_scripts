#!/bin/bash

for i in {0..4}
do
	echo -n "Enter the $ith element : "
	read arr[$i]
done

echo "${arr[@]}"

great=${arr[0]}
for i in {0..4}
do
	if [ ${arr[$i]} -gt $great ]
	then
		great=${arr[i]}
	fi
done

echo "The greatest $great"
