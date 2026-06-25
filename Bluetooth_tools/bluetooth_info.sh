#!/bin/bash

bluetoothctl devices | while read -r line; do
	mac=$(echo "$line" | awk '{print $2}')
	name=$(echo "$line" | cut -d' ' -f3-)
	status=$(bluetoothctl info "$mac" | grep "Connected" | awk '{print $2}')
	if [ "$status" = "yes" ]
	then
		battery=$(($(bluetoothctl info "$mac" | grep "Battery Percentage" | awk '{print $3}')))
		printf "%-20s %-15s %s%%\n" "$name" "Connected" "$battery"
	else
		printf "%-20s %s\n" "$name" "Not Connected"
	fi
done
	

