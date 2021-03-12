# DeployIoT

Instantaneous deployment of IIoT solutions on Debian-based platforms.

## Features

* Low-code edge-to-server flows with <a href="https://nodered.org">Node-RED</a> (United Kingdom)
* MQTT Troubleshooting with <a href="https://mosquitto.org">Mosquitto</a> (International)

## Setup (Linux)

[`Setup.sh`](Setup.sh) (REQUIRES ROOT ACCESS) installs and runs the official Node-RED Docker image continuously in the background. Set up your environment via the terminal (Ctrl+Alt+T) with:

```sh 
user@host:~$ sudo apt-get -y install git
user@host:~$ git clone https://github.com/JimothyJohn/DeployIoT.git
user@host:~$ cd DeployIoT
user@host:~$ ./Setup.sh
```

## Using Node-RED

Program your flows on your device at <a href="http://127.0.0.1:1880">http://localhost:1880/</a>. You can also access this same interface on ANY device's browser on the same network at http://[DEVICE_IP]:1880/. ALWAYS BE MINDFUL OF WHAT DEVICES ARE ABLE TO CONTROL YOUR EQUIPMENT!

## Viewing the dashboard 

(Requires <a href="https://flows.nodered.org/node/node-red-dashboard">node-red-dashboard</a>) Included in [`Setup.sh`](Setup.sh) is a shortcut to turn your display-based device into an HMI. Exit this mode with Alt+F4. (You can also view this on ANY device's browser on the same network at http://[DEVICE_IP]:1880/ui)

```sh 
user@host:~$ dashboard
```

## MQTT Troubleshooting

Use [`InstallMQTT.sh`](setup/InstallMQTT.sh) to install the Mosquitto MQTT broker then run in local-only mode.

```sh 
user@host:~/DeployIoT$ ./setup/InstallMQTT.sh
user@host:~$ killall mosquitto && mosquitto -d
```
