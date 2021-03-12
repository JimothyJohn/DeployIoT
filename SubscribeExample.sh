#!/usr/bin/env bash

HOST="127.0.0.1"
TOPIC="topic/"
mosquitto_sub -t $TOPIC -h $HOST
