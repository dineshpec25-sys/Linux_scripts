#!/bin/bash

for i in {1..5}
do
    echo -n "Enter the number : "
    read common[$i]
done

echo ${common[@]}
