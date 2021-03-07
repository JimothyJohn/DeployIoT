#!/usr/bin/env bash

HOST="192.168.1.19"
TOPIC="jetson"
MESSAGE="Testing"

mosquitto_pub -m $MESSAGE -t $TOPIC -h $HOST
