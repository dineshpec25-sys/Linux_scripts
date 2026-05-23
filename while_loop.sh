#!/bin/bash

echo -n "Enter the number:"
read num

while [ $num -le 3 ]
do
	echo "I Love Linux"
	num=$((num + 1))
done
