# DeployIoT
Instantaneous deployment of industrial IoT solutions.

## Features
* Low-code edge-to-server flows with <a href="https://nodered.org">Node-RED</a> (United Kingdom)
* MQTT Troubleshooting with <a href="https://mosquitto.org">Mosquitto</a> (International)

## Setup (Linux aarch64/x86_x64)

### OS Installation

Install scripts provided for Node-RED and Mosquitto:

```sh 
user@host:~$ git clone https://github.com/JimothyJohn/DeployIoT.git
user@host:~$ cd DeployIoT
user@host:~$ ./InstallNode-RED.sh
user@host:~$ ./InstallMQTT.sh
```

Start NodeRED with:

```sh 
user@host:~$ node-red
```

Restart Mosquitto in detached mode with:

```sh 
user@host:~$ killall mosquitto && mosquitto -d
```
