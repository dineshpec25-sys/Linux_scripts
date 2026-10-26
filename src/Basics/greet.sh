#!/usr/bin/env bash

if [[ -n $1 ]] ; then
	name=$1
else
	read -p "Entre your name :" name
fi

tim=$(date | awk '{print $4}')
echo "Hello, $name! now the time is $tim"
