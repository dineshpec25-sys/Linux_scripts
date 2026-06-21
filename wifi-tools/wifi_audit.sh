#!/bin/bash

# ================================================
# WiFi Audit Helper
# Author: Dinesh P
# Purpose:
#   - Find WiFi interface
#   - Discover devices in own LAN
#   - Enable/Disable monitor mode
#   - Learn Linux networking tools
#
# Use only on networks you own or manage
# ================================================


echo "
==============================
     WiFi Audit Helper
==============================
"

# check root
if [ "$EUID" -ne 0 ]
then
    echo "Run using sudo:"
    echo "sudo ./wifi_audit.sh"
    exit
fi


while true
do

echo "
1) Show WiFi interface
2) Scan connected devices (nmap)
3) Enable monitor mode
4) Show nearby WiFi networks
5) Restore normal WiFi
6) Exit
"

read -p "Choose option: " choice


case $choice in

1)

echo "[+] Interfaces:"
iw dev
;;

2)

read -p "Enter network range (example 192.168.1.0/24): " range

echo "[+] Scanning network..."

nmap -sn $range
;;

3)

read -p "Enter interface (example wlp3s0): " iface

echo "[+] Starting monitor mode"

airmon-ng start $iface
;;

4)

read -p "Enter monitor interface (example wlp3s0mon): " mon

echo "[+] Starting scan"
echo "Press CTRL+C to stop"

airodump-ng $mon
;;

5)

read -p "Enter monitor interface (example wlp3s0mon): " mon

echo "[+] Stopping monitor mode"

airmon-ng stop $mon

echo "[+] Restarting Network Manager"

systemctl restart NetworkManager

echo "[+] WiFi restored"
;;

6)

echo "Bye"
exit
;;

*)

echo "Invalid option"

;;

esac


done
