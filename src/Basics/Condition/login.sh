#!/bin/bash

echo -n "Username:"
read username

if [ $username = admin ]
then
	echo -n "Enter the Password:"
	read password

	if [ $password -eq 1234 ]
	then
		echo "Login successful"
	else
		echo "Wrong Password"
	fi
else
	echo "Wrong Username"
fi
