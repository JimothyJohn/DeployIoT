#!/usr/bin/env bash

OS="$(uname -a |  awk '{print $3}' | sed 's|.*-||')"
ARCH="$(uname -a | awk '{print $14}')"
KERNEL="$(uname -a | awk '{print $15}')"

echo "OS: $OS, ARCH: $ARCH, KERNEL: $KERNEL"
if [[ "$ARCH" == "aarch64" ]]; then
    echo "Installing for Debian"
    # Install script https://nodered.org/docs/getting-started/raspberrypi
    bash <(curl -sL https://raw.githubusercontent.com/node-red/linux-installers/master/deb/update-nodejs-and-nodered)
    # Install Mosquitto
    wget http://repo.mosquitto.org/debian/mosquitto-repo.gpg.key
    sudo apt-key add mosquitto-repo.gpg.key
    # rm mosquitto-repo.gpg.key
    sudo wget http://repo.mosquitto.org/debian/mosquitto-stretch.list -P /etc/apt/sources.list.d/
    apt-get update
    apt-get -y install mosquitto
elif [[ "$ARCH" == "x86_64" ]]; then
    echo "Installing for Ubuntu 64-bit"
    # Install Node.js https://github.com/nodesource/distributions/blob/master/README.md#debinstall
    curl -fsSL https://deb.nodesource.com/setup_12.x | sudo -E bash -
    sudo apt-get install -y nodejs
    
    # Install Node-RED
    sudo npm install -y -g --unsafe-perm node-red
    # Install new nodes
    npm install node-red-dashboard \
        node-red-contrib-cip-ethernet-ip \
        node-red-contrib-s7 \
        node-red-contrib-modbus \
        node-red-contrib-opcua \
        node-red-contrib-aws \
        node-red-contrib-tensorflow \
        node-red-contrib-tf-model \
        node-red-contrib-ur-robot

    # Install Mosquitto
    sudo apt-add-repository ppa:mosquitto-dev/mosquitto-ppa
    sudo apt-get update
    sudo apt-get -y install mosquitto
else
    echo "OS not recognized!"
fi
