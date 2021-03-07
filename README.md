# DeployIoT

Instantaneous deployment of IIoT solutions.

## Features

* Low-code edge-to-server flows with <a href="https://nodered.org">Node-RED</a> (United Kingdom)
* MQTT Troubleshooting with <a href="https://mosquitto.org">Mosquitto</a> (International)

## Setup (Linux aarch64/x86_x64)

Install scripts provided for Node-RED and Mosquitto:

```sh 
user@host:~$ sudo apt-get -y install git
user@host:~$ git clone https://github.com/JimothyJohn/DeployIoT.git
user@host:~$ cd DeployIoT
user@host:~$ ./InstallNode-RED.sh
user@host:~$ ./InstallMQTT.sh
```

## Running the program

By default Node-RED will start in local-only mode at <a href="http://127.0.0.1:1880">localhost:1880</a>. Start Node-RED with:

```sh 
user@host:~$ node-red
```

By default Mosquitto will start in local-only mode at 127.0.0.1:1883. Restart Mosquitto (detached) with:

```sh 
user@host:~$ killall mosquitto && mosquitto -d
```
