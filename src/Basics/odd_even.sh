#!/bin/bash

echo -n "Enter the number : "
read num

if [ $((num % 2)) -eq 0 ]
then
	echo "The number id even"
else
	echo "The number is odd"
fi
