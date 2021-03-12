#!/usr/bin/env bash

# Get platform info THEN extract a line with "Distributor" THEN
# get the third "column" THEN convert to lowercase
PLATFORM="$(lsb_release -a | grep Distributor | awk '{print $3}' | tr '[:upper:]' '[:lower:]')"
ARCH="$(dpkg --print-architecture)"
OS="$(lsb_release -cs)"

if [[ "$PLATFORM" == "debian" ]]; then
    echo "Installing for Debian"
    # Add repositories
    wget http://repo.mosquitto.org/debian/mosquitto-repo.gpg.key
    sudo apt-key add mosquitto-repo.gpg.key
    sudo wget http://repo.mosquitto.org/debian/mosquitto-stretch.list -P /etc/apt/sources.list.d/
elif [[ "$PLATFORM" == "ubuntu" ]]; then
    echo "Installing for Ubuntu"
    # Add repositories
    sudo apt-add-repository ppa:mosquitto-dev/mosquitto-ppa
else
    echo "Device not recognized!"
fi

sudo apt-get update
sudo apt-get -y install mosquitto
sudo systemctl restart mosquitto
