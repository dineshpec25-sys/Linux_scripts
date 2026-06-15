#!/bin/bash

echo -n "Enter the age:"
read age

if [ $age -gt 18 ]
then
	echo "Adult"
else 
	echo "Minor"
fi
