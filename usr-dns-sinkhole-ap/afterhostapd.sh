sudo pkill dnsmasq
ifconfig replaceme up 192.168.1.254 netmask 255.255.255.0
ifconfig replaceme mtu 1400
sudo route add -net 192.168.1.0 netmask 255.255.255.0 gw 192.168.1.254
sudo dnsmasq -C /usr/share/dns-sinkhole-ap/temp-run/dnsmasq.conf
