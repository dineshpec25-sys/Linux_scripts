#!/bin/bash

for i in {1..5}
do
    count=0
    while [ $i -gt $count ]
    do
        echo -n "*"
        count=$((count+1))
    done
    echo
done
