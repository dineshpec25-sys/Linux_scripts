#!/bin/bash

echo -n "Enter the number : "
read num

prime=1

if [ $num -le 1 ]
then
	echo "Neither prime nor composite"
fi

i=2
while [ $((i*i)) -le $num ]
do
	if [ $((num%i)) -eq 0 ]
	then
		prime=0
		break
	fi
	i=$((i+1))
done

if [ $prime -eq 1 ]
then
	echo "Prime"
else
	echo "Not Prime"
fi
