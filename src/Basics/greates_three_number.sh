#!/bin/bash

echo -n "Enter the first number : "
read num1
echo -n "Enter the second number : "
read num2
echo -n "Enter the third number : "
read num3

if [ $num1 -gt $num2 ]
then
	if [ $num1 -gt $num3 ]
	then
		echo "$num1 is greater"
	else
		echo "$num3 is greater"
	fi
else
	if [ $num2 -gt $num3 ]
	then
		echo "$num2 is greater"
	else
		echo "$num3 is greater"
	fi
fi
