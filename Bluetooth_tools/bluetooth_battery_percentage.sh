#!/bin/bash
echo "Connected Devices & Battery Status"
echo "-----------------------------------"

bluetoothctl devices Connected | while read -r line; do
    mac=$(echo "$line" | awk '{print $2}')
    name=$(echo "$line" | cut -d' ' -f3-)
    battery=$(bluetoothctl info "$mac" | grep "Battery Percentage" | awk -F'[()]' '{print $2}')

    if [ -n "$battery" ]; then
        echo "$name ($mac): ${battery}%"
    else
        echo "$name ($mac): No battery info"
    fi
done
