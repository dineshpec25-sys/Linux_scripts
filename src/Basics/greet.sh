#!/usr/bin/env bash

echo -n Entre your name:
read name
tim=$(date | awk '{print $4}')
echo "Hello, $name! now the time is $tim"
