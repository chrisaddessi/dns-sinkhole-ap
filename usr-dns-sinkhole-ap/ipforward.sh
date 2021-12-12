#!/bin/bash
iptables --table nat --append POSTROUTING --out-interface maininterface -j MASQUERADE
iptables --append FORWARD --in-interface replaceme -j ACCEPT
echo 1 > /proc/sys/net/ipv4/ip_forward
sudo iptables -A INPUT -p tcp -m tcp --dport 8080 -j ACCEPT
