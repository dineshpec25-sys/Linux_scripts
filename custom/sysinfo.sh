#!/bin/bash

kernal=$(uname -a | awk '{print $1}')
hostname=$(uname -a | awk '{print $2}')
kernalversion=$(uname -a | awk '{print $3}')
cpu=$(uname -a | awk '{print $13}')
echo "Kernel = $kernal"
echo "Host Name = $hostname"
echo "Kernel Version = $kernalversion"
echo "CPU Architecture = $cpu"
