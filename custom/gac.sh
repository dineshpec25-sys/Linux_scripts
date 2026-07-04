#!/bin/bash

if [ -z "$1" ]; then
	echo "Usage: gac \"Commit message\""
	return 1
fi
git add . && git commit -m "$1" && git push
	
