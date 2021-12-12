#!/bin/bash

echo > /usr/share/dns-sinkhole-ap/hostapd.conf.tmp
while IFS= read -r line; do
    lineedit="$line"
    lineedit=$(echo "$lineedit" | sed "s/DefaultName/$1/g")
    echo $lineedit >> /usr/share/dns-sinkhole-ap/hostapd.conf.tmp
done < /usr/share/dns-sinkhole-ap/hostapd.conf.og.mod
mv /usr/share/dns-sinkhole-ap/hostapd.conf.tmp /usr/share/dns-sinkhole-ap/hostapd.conf.og
