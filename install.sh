#!/bin/bash
#echo "What user do you want this to run on boot for crontab? "
#read userinput
sudo apt install dnsmasq hostapd iptables-persistent php -y
sudo cp -r usr-dns-sinkhole-ap* /usr/share/dns-sinkhole-ap
sudo cp dns-sinkhole-ap.sh /usr/bin/dns-sinkhole-ap

sudo chmod +x /usr/bin/dns-sinkhole-ap
sudo chmod +x /usr/share/dns-sinkhole-ap/preppinic.sh
sudo chmod +x /usr/share/dns-sinkhole-ap/phpreplace.sh
sudo chmod +x /usr/share/dns-sinkhole-ap/start-web-server.sh
sudo chmod +x /usr/share/dns-sinkhole-ap/phpniccode.sh
sudo chmod +x /usr/share/dns-sinkhole-ap/phprmac.sh

sudo mkdir /usr/share/dns-sinkhole-ap/temp-run
sudo cp pinicornot.txt /usr/share/dns-sinkhole-ap/pinicornot.txt
sudo chmod 666 /usr/share/dns-sinkhole-ap/pinicornot.txt

sudo echo "@reboot sleep 60 && sudo /usr/bin/bash /usr/bin/dns-sinkhole-ap" >> /var/spool/cron/crontabs/root
sudo chown root:crontab /var/spool/cron/crontabs/root
sudo chmod 600 /var/spool/cron/crontabs/root
echo " "
clear
echo "you must unplug all extra wireless network cards!"
echo "You will need to reboot your computer to start the dns-sinkhole-ap service!"
