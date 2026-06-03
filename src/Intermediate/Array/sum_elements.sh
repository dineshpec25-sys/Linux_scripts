#!/bin/bash

sum=0
for i in {1..5}
do
    echo -n "Enter the number : "
    read common[$i]
    sum=$((sum+${common[i]}))
done

echo "The Sum : $sum"
