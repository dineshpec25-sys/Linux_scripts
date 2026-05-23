#!/bin/bash

echo -n "Enter the number:"
read num

while [ $num -le 5 ]
do
	echo "I Love Linux"
	num=$((num + 1))
done
