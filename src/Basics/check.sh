#!/usr/bin/env bash
PATH_TO_CHECK='.'
if [ -n "$1" ];
then
	PATH_TO_CHECK="$1"
fi

if [ ! -d "$PATH_TO_CHECK" ]; then
	echo "Error!!! $PATH_TO_CHECK doesn't exist or can't find"
	exit 1
fi

count=0
for i in "$PATH_TO_CHECK"/*.sh; do
	if [ -f "$i" ]; then
		((count++))
		echo "$count: $i"
	fi
done
