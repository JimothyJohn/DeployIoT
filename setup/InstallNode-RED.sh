#!/usr/bin/env bash

OS="$(lsb_release -a | grep Distributor | awk '{print $3}' | tr '[:upper:]' '[:lower:]')"
ARCH="$(uname -a | awk '{print $14}')"

echo "OS: $OS, ARCH: $ARCH"
if [[ "$ARCH" == "aarch64" ]]; then
    echo "Installing for ARM"
    # Install script https://nodered.org/docs/getting-started/raspberrypi
    bash <(curl -sL https://raw.githubusercontent.com/node-red/linux-installers/master/deb/update-nodejs-and-nodered)
elif [[ "$ARCH" == "x86_64" ]]; then
    echo "Installing for 64-bit"
    # Install Node.js https://github.com/nodesource/distributions/blob/master/README.md#debinstall
    curl -fsSL https://deb.nodesource.com/setup_12.x | sudo -E bash -
    sudo apt-get install -y nodejs
    
    # Install Node-RED
    sudo npm install -y -g --unsafe-perm node-red
else
    echo "Device not recognized!"
fi
