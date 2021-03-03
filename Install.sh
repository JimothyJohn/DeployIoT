#!/usr/bin/env bash

OS="$(uname -a |  awk '{print $1}')"
# OS="$(uname -a |  awk '{print $3}' | sed 's|.*-||')"
ARCH="$(uname -a | awk '{print $15}')"
# KERNEL="$(uname -a | awk '{print $15}')"

echo "OS: $OS, ARCH: $ARCH"
if [[ "$ARCH" == "aarch64" ]]; then
    echo "Installing for ARM"
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
    echo "Installing for 64-bit"
    if [[ "$OS" == "Linux" ]]; then
        echo "Installing for Linux"
        # Install Node.js https://github.com/nodesource/distributions/blob/master/README.md#debinstall
        curl -fsSL https://deb.nodesource.com/setup_12.x | sudo -E bash -
        sudo apt-get install -y nodejs
        
        # Install Node-RED
        sudo npm install -y -g --unsafe-perm node-red
        
        # Install Mosquitto
        sudo apt-add-repository ppa:mosquitto-dev/mosquitto-ppa
        sudo apt-get update
        sudo apt-get -y install mosquitto
    elif [[ "$OS" == "Darwin" ]]; then
        echo "Installing for OSX"
        # Install Node.js (modified) https://nodejs.org/en/download/package-manager/#macos
        curl "https://nodejs.org/download/release/latest-v12.x/node-v12.21.0.pkg" > "$HOME/Downloads/node-v12.21.0.pkg" \
            && sudo installer -store -pkg "$HOME/Downloads/node-v12.21.0.pkg" -target "/"
        # Install Node-RED
        sudo npm install -y -g --unsafe-perm node-red

        # Install Mosquitto
        brew install mosquitto
    fi
else
    echo "Device not recognized!"
fi

echo -n "Enter username: "
read -s USER
echo -n "Enter password for keyword file"
sudo mkdir -p /etc/mosquitto/
sudo mosquitto_passwd -c /etc/mosquitto/passwd "$USER"
echo "allow_anonymous false\\npassword_file /etc/mosquitto/passwd" > /etc/mosquitto/conf.d/default.conf
sudo systemctl restart mosquitto
