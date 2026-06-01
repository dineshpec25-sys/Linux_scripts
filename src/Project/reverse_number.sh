#!/bin/bash

temp=0
new_temp=0
echo -n "Enter the number : "
read num
while [ $num -ne 0 ]
do
	temp=$((num%10))
	num=$((num/10))
	new_temp=$((new_temp*10))
	new_temp=$((new_temp+temp))
done

echo "$new_temp"
