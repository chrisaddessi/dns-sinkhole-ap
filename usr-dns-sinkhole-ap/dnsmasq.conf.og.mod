dhcp-range=192.168.1.2,192.168.1.30,255.255.255.0,12h
dhcp-option=3,192.168.1.254
dhcp-option=6,192.168.1.254
#server=94.140.14.14
server=192.168.1.254
addn-hosts=/usr/share/dns-sinkhole-ap/dns-sinkhole-lists
log-queries
logfacility=/tmp/dnsmasq.log
log-dhcp
listen-address=127.0.0.1


#interface=wlan0

#dhcp-range=10.0.0.10,10.0.0.250,255.255.255.0,12h

#dhcp-option=3,10.0.0.1

#dhcp-option=6,10.0.0.1

#server=8.8.8.8

#log-queries

#log-dhcp

#listen-address=127.0.0.1
