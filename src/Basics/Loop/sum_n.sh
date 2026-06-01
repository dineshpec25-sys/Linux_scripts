#!/bin/bash

count=1
sum=0

echo -n "Enter the number : "
read N
while [ $count -le $N ]
do
	sum=$((sum+count))
	count=$((count+1))
done

echo "The sum $sum"

