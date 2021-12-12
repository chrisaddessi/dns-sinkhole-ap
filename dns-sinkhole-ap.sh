#!/bin/bash

defaultornot=$(sudo cat /usr/share/dns-sinkhole-ap/pinicornot.txt)
defaultornot=${defaultornot//$'\n'/}
defaultornot=${defaultornot%$'\n'}
#echo $defaultornot
if [ $defaultornot = '2' ]; then
    wlan0=$(sudo cat /sys/class/net/wlan0/address)
    wlan1=$(sudo cat /sys/class/net/wlan1/address)

    # get the interface that has the Realtek NIC
    # and get the main interface connected to the internet
    if [[ $wlan0 == "34:e8:94:e2:cd:4c" ]]
    then
        interface="wlan0"
        interfacemain="wlan1"
    elif [[ $wlan1 == "34:e8:94:e2:cd:4c" ]]
    then
        interface="wlan1"
        interfacemain="wlan0"
    else
	sudo /./usr/share/dns-sinkhole-ap/preppinic.sh
	sudo systemctl daemon-reload
	sudo systemctl restart dhcpcd
	interface="wlan0"
	interfacemain="eth0"
    fi
    #Replace the og files with run files where the proper interface is set
    ## mon.sh file
    echo > /usr/share/dns-sinkhole-ap/temp-run/run-mon.sh
    while IFS= read -r line; do
	lineedit="$line"
	lineedit=$(echo "$lineedit" | sed "s/replaceme/$interface/g")
	echo $lineedit >> /usr/share/dns-sinkhole-ap/temp-run/run-mon.sh
    done < /usr/share/dns-sinkhole-ap/mon.sh
    
    # PUT REALTEK into Monitor Mode

    sudo bash /usr/share/dns-sinkhole-ap/temp-run/run-mon.sh   >> /home/pi/Desktop/allinone.log

else
    sudo /./usr/share/dns-sinkhole-ap/preppinic.sh
    sudo systemctl daemon-reload
    sudo systemctl restart dhcpcd
   interface="wlan0"
   interfacemain="eth0"
fi












##hostapd.conf file
echo > /usr/share/dns-sinkhole-ap/temp-run/hostapd.conf
while IFS= read -r line; do
    lineedit="$line"
    lineedit=$(echo "$lineedit" | sed "s/replaceme/$interface/g")
    echo $lineedit >> /usr/share/dns-sinkhole-ap/temp-run/hostapd.conf
done < /usr/share/dns-sinkhole-ap/hostapd.conf.og


##dnsmasq.conf file
echo "interface=$interface" > /usr/share/dns-sinkhole-ap/temp-run/dnsmasq.conf
while IFS= read -r line; do
    lineedit="$line"
    echo $lineedit >> /usr/share/dns-sinkhole-ap/temp-run/dnsmasq.conf
done < /usr/share/dns-sinkhole-ap/dnsmasq.conf.og.mod



## afterhostapd.sh
echo > /usr/share/dns-sinkhole-ap/temp-run/run-afterhostapd.sh
while IFS= read -r line; do
    lineedit="$line"
    lineedit=$(echo "$lineedit" | sed "s/replaceme/$interface/g")
    echo $lineedit >> /usr/share/dns-sinkhole-ap/temp-run/run-afterhostapd.sh
done < /usr/share/dns-sinkhole-ap/afterhostapd.sh

## ipforward.sh
echo > /usr/share/dns-sinkhole-ap/temp-run/run-ipforward.sh
while IFS= read -r line; do
    lineedit="$line"
    lineedit=$(echo "$lineedit" | sed "s/replaceme/$interface/g")
    lineedit=$(echo "$lineedit" | sed "s/maininterface/$interfacemain/g")
    echo $lineedit >> /usr/share/dns-sinkhole-ap/temp-run/run-ipforward.sh
done < /usr/share/dns-sinkhole-ap/ipforward.sh




#make sure dnsmasq is not already running
sudo pkill dnsmasq


# Start AP

sudo hostapd /usr/share/dns-sinkhole-ap/temp-run/hostapd.conf -B   >> /home/pi/Desktop/allinone.log

# set up DNS

touch /tmp/dnsmasq.log
chmod 777 /tmp/dnsmasq.log
sudo bash /usr/share/dns-sinkhole-ap/temp-run/run-afterhostapd.sh   >> /home/pi/Desktop/allinone.log

# set up IP forwarding

sudo bash /usr/share/dns-sinkhole-ap/temp-run/run-ipforward.sh   >> /home/pi/Desktop/allinone.log


sudo /./usr/share/dns-sinkhole-ap/start-web-server.sh
