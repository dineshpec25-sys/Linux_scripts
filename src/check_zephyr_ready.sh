#!/bin/bash

echo "================================="
echo " ZEPHYR INSTALLATION PRE-CHECK"
echo "================================="


echo ""
echo "[1] Operating System"
lsb_release -a


echo ""
echo "[2] Architecture"

ARCH=$(uname -m)
echo "Architecture: $ARCH"

if [ "$ARCH" = "x86_64" ]; then
    echo "OK: 64-bit PC"
else
    echo "WARNING: Not x86_64"
fi


echo ""
echo "[3] Storage"

FREE=$(df -BG / | awk 'NR==2 {print $4}' | sed 's/G//')

echo "Free Space: ${FREE}GB"

if [ "$FREE" -ge 30 ]; then
    echo "OK: Enough storage"
else
    echo "ERROR: Need minimum 30GB"
fi


echo ""
echo "[4] Internet"

if ping -c 3 github.com > /dev/null
then
    echo "OK: GitHub reachable"
else
    echo "ERROR: Internet/GitHub problem"
fi


echo ""
echo "[5] Sudo Permission"

if sudo -v
then
    echo "OK: sudo available"
else
    echo "ERROR: no sudo access"
fi


echo ""
echo "[6] Existing Tools"

check_tool()
{
    if command -v $1 > /dev/null
    then
        echo "$1 : installed"
        $1 --version | head -1
    else
        echo "$1 : missing"
    fi
}

check_tool git
check_tool cmake
check_tool ninja
check_tool python3
check_tool dtc


echo ""
echo "[7] Old Zephyr Check"

if [ -d "$HOME/zephyrproject" ]
then
    echo "WARNING: Existing zephyrproject found"
else
    echo "OK: No old Zephyr workspace"
fi


echo ""
echo "================================="
echo " PRE-CHECK COMPLETED"
echo "================================="