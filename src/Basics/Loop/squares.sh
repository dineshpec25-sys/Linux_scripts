#!/bin/bash

squ=0
for i in {1..10}
do
	squ=$((i*i))
	echo "The square of $i is $squ"
done
