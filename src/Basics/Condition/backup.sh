#!/bin/bash

echo -n "Enter the folder name:"
read folder

if [[ -d $folder ]]
then
	echo "Folder found"
	mkdir -p backup
	cp -rp "$folder" backup
	echo "backup created"
else
	echo "Folder not found"
fi
