#!/bin/bash

fruits=("apple" "mango" "orange")

echo ${fruits[0]} # access one elements in the array
echo ${fruits[1]}
echo ${fruits[2]}

echo ${fruits[@]} # @ prints all the elements in the array

for fruit in ${fruits[@]}
do
    echo $fruit
done

echo ${#fruits[@]} #to find the length of the array. How many elements ?

fruits[0]="C" #Changing the elements in the array
fruits[1]="Python"
fruits[2]="C++"

fruits+=("Java") #Adding new elements to the array not fixed size

echo ${fruits[@]}
echo "${#fruits[@]}"
