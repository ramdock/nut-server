#!/bin/bash

# add custom id and password to secure nut-server
echo "\n$ID|$PASSWORD" >> /root/nut.src.latest/conf/users.conf
echo "* * * * * wget --spider --user $ID --password $PASSWORD http://127.0.0.1:9000/api/scan >> /var/log/cron.log\n" > /etc/cron.d/scraping-nut
chmod 0644 /etc/cron.d/scraping-nut && crontab /etc/cron.d/scraping-nut

#cron -f &
service cron start

python3 /root/nut.src.latest/nut.py -S >> /var/log/nut.log
