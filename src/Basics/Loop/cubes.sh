#!/bin/bash

cube=0
for i in {1..10}
do
	cube=$((i*i*i))
	echo "The cube of $i is $cube"
done
