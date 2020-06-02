#!/bin/bash

HOST="127.0.0.1"
PORT=12345
LOOP=40


for ((i=0;i<$LOOP;i++)) do
	echo "Very Large Message Sent" | nc -4u $HOST $PORT &
done
