#!/usr/bin/env bash

OS="$(uname -a |  awk '{print $1}')"
ARCH="$(uname -a | awk '{print $14}')"

if [[ "$ARCH" == "aarch64" ]]; then
    echo "Installing for ARM"
    # Add repositories
    wget http://repo.mosquitto.org/debian/mosquitto-repo.gpg.key
    sudo apt-key add mosquitto-repo.gpg.key
    sudo wget http://repo.mosquitto.org/debian/mosquitto-stretch.list -P /etc/apt/sources.list.d/
elif [[ "$ARCH" == "x86_64" ]]; then
    echo "Installing for 64-bit"
    # Add repositories
    sudo apt-add-repository ppa:mosquitto-dev/mosquitto-ppa
else
    echo "Device not recognized!"
fi

sudo apt-get update
sudo apt-get -y install mosquitto
echo -n "Enter username for Mosquitto key: "
read -s USER
sudo mkdir -p /etc/mosquitto/
sudo mosquitto_passwd -c /etc/mosquitto/passwd "$USER"
echo "allow_anonymous false\\npassword_file /etc/mosquitto/passwd" > /etc/mosquitto/conf.d/default.conf
sudo systemctl restart mosquitto
