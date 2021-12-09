#Use old files from Captive-Portal-AP project to set up dns ipforwarding and ap


07DEC2021
########################### install drivers for rtl8188eus ###########################
# go to https://github.com/aircrack-ng/rtl8188eus
# follow the instructions
######################################################################################

########################### install drivers for rtl8188eus ###########################
# To get the blocker-AP service to run
## power on pi without extranl NIC
## once pi has fully booted plug in external NIC
## run these commands
sudo bash mon.sh
sudo hostapd hostapd.conf -B
sudo bash afterhost.sh #needs to run as background process
sudo bash ipforward.sh
## done
#######################################################################################



08DEC2021
#start on boot
sudo cp start-blocker-dns-sinkhole.service /etc/systemd/system/dns-sinkhole-ap.service
sudo systemctl enable dns-sinkhole-ap



sudo mkdir dns-sinkhole-ap
sudo cp -r usr-dns-sinkhole-ap* /usr/share/dns-sinkhole-ap
sudo cp dns-sinkhole-ap.sh /usr/bin/dns-sinkhole-ap
sudo cp dns-sinkhole-ap.service /etc/systemd/system/dns-sinkhole-ap.service
sudo systemctl enable dns-sinkhole-ap
echo "You will need to reboot your computer to start the dns-sinkhole-ap service."

/usr/share/dns-sinkhole-ap/dns-sinkhole-lists



sudo chmod 744 /home/pi/Desktop/BlockerFiles/start-blocker-dns-sinkhole.sh
# mover the .service file to /etc/systemd/system/
sudo chmod 664 /etc/systemd/system/start-blocker-dns-sinkhole.service


sudo systemctl daemon-reload
sudo systemctl enable start-blocker-dns-sinkhole.service

# these commands need to be run as sudo no password

# not required raspian does not ask for passowrd ever
pi	All=(All) NOPASSWD: /home/pi/Desktop/BlockerFiles/mon.sh, /usr/sbin/hostapd, /home/pi/Desktop/BlockerFiles/afterhostapd.sh, /home/pi/Desktop/BlockerFiles/ipforward.sh

#then make a start-blocker-AP.sh with the above commands. make that file run on boot

#later endvors 
make a page to switch wifi networks along with wlan0 or ethernetport
make a auto install script and post on github
