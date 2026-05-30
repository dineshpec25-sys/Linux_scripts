#!/bin/bash

echo -n "Enter the first number : "
read num1
echo -n "Enter the second number : "
read num2

if [ $num1 -gt $num2 ]
then
	echo "$num1 is greater"
else
	echo "$num2 is greater"
fi
