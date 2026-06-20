#!/bin/bash

set -e


echo "================================="
echo " FULL ZEPHYR INSTALLATION"
echo "================================="


echo "[1/10] Updating Ubuntu"

sudo apt update
sudo apt upgrade -y



echo "[2/10] Installing dependencies"


sudo apt install --no-install-recommends -y \
git \
cmake \
ninja-build \
gperf \
ccache \
dfu-util \
device-tree-compiler \
wget \
python3-dev \
python3-venv \
python3-tk \
xz-utils \
file \
make \
gcc \
gcc-multilib \
g++-multilib \
libsdl2-dev \
libmagic1 \
libusb-1.0-0-dev \
pkg-config



echo "[3/10] Creating workspace"

cd ~

rm -rf zephyrproject

mkdir zephyrproject


python3 -m venv ~/zephyrproject/.venv


source ~/zephyrproject/.venv/bin/activate



echo "[4/10] Installing WEST"

pip install --upgrade pip setuptools wheel

pip install west



echo "[5/10] Downloading Zephyr"


west init ~/zephyrproject

cd ~/zephyrproject


git config --global http.version HTTP/1.1
git config --global http.postBuffer 524288000



echo "[6/10] Downloading ALL modules"

west update -j 8



echo "[7/10] Exporting Zephyr"

west zephyr-export



echo "[8/10] Installing Python packages"

west packages pip --install



echo "[9/10] Installing Zephyr SDK"

cd ~/zephyrproject/zephyr

west sdk install



echo "[10/10] Testing build"

west build \
-p always \
-b qemu_cortex_m3 \
samples/hello_world



echo ""
echo "================================="
echo " ZEPHYR READY"
echo "================================="

echo ""
echo "Start Zephyr using:"
echo ""
echo "cd ~/zephyrproject"
echo "source .venv/bin/activate"
echo "cd zephyr"