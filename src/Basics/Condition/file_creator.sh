#!/bin/bash

echo -n "Enter the number of files:"
read num

i=1

mkdir -p trash
while [[ $i -le $num ]]
do
	touch "trash/file$i.txt"
	((i++))
done
