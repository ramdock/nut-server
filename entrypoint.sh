#!/bin/bash

# add custom id and password to secure nut-server
echo "\n$ID|$PASSWORD" >> /root/nut.src.latest/conf/users.conf

python3 /root/nut.src.latest/nut.py -S >> /var/log/nut.log
