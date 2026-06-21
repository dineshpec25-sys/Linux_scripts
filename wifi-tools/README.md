# WiFi Audit Helper

A Linux Bash tool for learning WiFi networking.

## Features

- Find wireless interfaces
- Discover LAN devices
- View IP and MAC addresses
- Enable monitor mode
- Scan WiFi networks
- Restore WiFi adapter


## Tools Used

### nmap

Network discovery tool.

Example:

nmap -sn 192.168.1.0/24

Finds devices connected to your LAN.


### iw

Linux wireless configuration utility.

Shows:

- Interface name
- Adapter mode


### airmon-ng

Part of Aircrack-ng.

Switches adapter:

managed mode ↔ monitor mode


### airodump-ng

Captures WiFi management information.

Shows:

- Router BSSID
- Channel
- Connected stations


## WiFi Modes

Managed Mode:

Normal WiFi connection.

Laptop <--> Router


Monitor Mode:

Adapter listens to WiFi frames.

Used for:

- Learning
- Troubleshooting
- Security testing


## Restore WiFi

If WiFi disappears:

sudo airmon-ng stop wlan0mon

sudo systemctl restart NetworkManager


## Note

Use only on networks you own or have permission to test.
