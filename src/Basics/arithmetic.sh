#!/bin/bash

echo -n "Enter Number 1 : "
read num1
echo -n "Enter Number 2 : "
read num2

sum=$((num1 + num2))
diff=$((num1 - num2))
product=$((num1 * num2))

echo "The sum : $sum"
echo "The diff : $diff"
echo "The product : $product"
