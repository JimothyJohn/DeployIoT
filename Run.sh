#!/usr/bin/env bash

killall mosquitto
mosquitto -d -c conf/mosquitto.conf
node-red
