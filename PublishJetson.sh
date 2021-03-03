#!/usr/bin/env bash

mosquitto_pub -m "hello from jetson" -t jetson -h 192.168.1.19
