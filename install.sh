sudo apt install dnsmasq hostapd iptables-persistent -y

sudo cp -r usr-dns-sinkhole-ap* /usr/share/dns-sinkhole-ap
sudo cp dns-sinkhole-ap.sh /usr/bin/dns-sinkhole-ap
sudo mkdir /usr/share/dns-sinkhole-ap/temp-run
sudo cp dns-sinkhole-ap.service /etc/systemd/system/dns-sinkhole-ap.service
sudo systemctl enable dns-sinkhole-ap
echo "You will need to reboot your computer to start the dns-sinkhole-ap service."
