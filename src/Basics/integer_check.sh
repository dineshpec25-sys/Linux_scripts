#!/bin/bash

echo -n "Enter the number : "
read num

if [ $num -eq 0 ]
then
	echo "The given number is $num"
elif [ $num -ge 1 ]
then
	echo "The given number is positive"
else
	echo "The given number is negative"
fi
