#!/bin/bash

f1=0
f2=1
f=0

echo -n "Enter the number : "
read num

echo "$f1"
echo "$f2"

i=0
while [ $i -lt $num ]
do
	f=$((f1+f2))
	f1=$f2
	f2=$f
	echo "$f"
	i=$((i+1))
done

