#!/usr/bin/env bash

HOST="192.168.1.19"
TOPIC="jetson"
mosquitto_sub -t $TOPIC -h $HOST
