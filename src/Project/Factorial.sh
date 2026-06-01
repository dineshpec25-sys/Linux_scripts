#!/bin/bash

echo -n "Enter the Number: "
read N

fact=1

while [ $N -ge 1 ]
do
    fact=$((fact * N))
    N=$((N - 1))
done

echo "$fact"
