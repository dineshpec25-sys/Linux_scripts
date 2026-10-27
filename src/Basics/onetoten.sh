#!/usr/bin/env bash

for thing in {1..10}; do
	echo $thing
done

echo 'C type for'
for ((i=0; i < 11; i++)); do
	echo $i
done
