#!/bin/bash

echo -n "Enter the Number:"
read num

for i in {1..10}
do
	echo "$i x $num = $((num * i))"
done
