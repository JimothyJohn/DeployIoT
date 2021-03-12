#!/usr/bin/env bash

# Install prereqs
sudo apt-get update && apt-get -y upgrade
sudo apt-get -y install curl net-tools

# Download, run, then delete install script
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
rm get-docker.sh

# Configure to run on boot
systemctl enable docker.service
systemctl enable containerd.service

# Create data directory
mkdir $HOME/node_red_data
# Run image in detached mode and automatically start
sudo docker run -dit -p 1880:1880 \
    -v $HOME/node_red_data:/data \
    --restart unless-stopped \
    --name node-red \
    nodered/node-red

# Add "dashboard" shortcut command
echo "alias dashboard=\"firefox -kiosk http://localhost:1880/ui\"" >> $HOME/.bashrc
. $HOME/.bashrc
