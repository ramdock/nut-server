#!/bin/bash

cd /root/nut

python3 nut.py -S >> nut.log

#init scan of games folder and scan every 60 secs
watch -n 60 wget -q --spider --user guest --password guest http://127.0.0.1:9000/api/scan
