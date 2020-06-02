#!/usr/bin/env python3

import socket

PORT = 12345
HOST = "127.0.0.1"

s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
s.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEPORT, 1)
s.bind((HOST, PORT))
print(f"Started listening on {HOST}:{PORT}") 
counter = 1
while True:
 data = s.recv(1024)
 print(f"Received Message [{counter}] from [Second] App: {data}")
 counter += 1
