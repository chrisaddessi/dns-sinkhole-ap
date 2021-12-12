#!/bin/bash
cd /usr/share/dns-sinkhole-ap && nohup php -S 192.168.1.254:8080 > /tmp/phpd.log 2>&1 &
