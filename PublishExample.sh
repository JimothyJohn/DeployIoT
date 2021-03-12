#!/usr/bin/env bash

HOST="127.0.0.1"
TOPIC="topic/"
MESSAGE="Testing"

mosquitto_pub -m $MESSAGE -t $TOPIC -h $HOST
