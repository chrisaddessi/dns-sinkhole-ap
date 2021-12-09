



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
fi

echo "################################################################ START ###################################################"#  >> /home/pi/Desktop/allinone.log
echo "REALTEK Interface: $interface" #  >> /home/pi/Desktop/allinone.log
echo "MAIN interface: $interfacemain" #  >> /home/pi/Desktop/allinone.log



#Replace the og files with run files where the proper interface is set
## mon.sh file
echo > /home/pi/Desktop/BlockerFiles/temp-run/run-mon.sh
while IFS= read -r line; do
    lineedit="$line"
    lineedit=$(echo "$lineedit" | sed "s/replaceme/$interface/g")
    echo $lineedit >> /home/pi/Desktop/BlockerFiles/temp-run/run-mon.sh
done < /home/pi/Desktop/BlockerFiles/mon.sh


##hostapd.conf file
echo > /home/pi/Desktop/BlockerFiles/temp-run/hostapd.conf
while IFS= read -r line; do
    lineedit="$line"
    lineedit=$(echo "$lineedit" | sed "s/replaceme/$interface/g")
    echo $lineedit >> /home/pi/Desktop/BlockerFiles/temp-run/hostapd.conf
done < /home/pi/Desktop/BlockerFiles/hostapd.conf.og


##dnsmasq.conf file
echo "interface=$interface" > /home/pi/Desktop/BlockerFiles/temp-run/dnsmasq.conf
while IFS= read -r line; do
    lineedit="$line"
    echo $lineedit >> /home/pi/Desktop/BlockerFiles/temp-run/dnsmasq.conf
done < /home/pi/Desktop/BlockerFiles/dnsmasq.conf.og.mod



## afterhostapd.sh
echo > /home/pi/Desktop/BlockerFiles/temp-run/run-afterhostapd.sh
while IFS= read -r line; do
    lineedit="$line"
    lineedit=$(echo "$lineedit" | sed "s/replaceme/$interface/g")
    echo $lineedit >> /home/pi/Desktop/BlockerFiles/temp-run/run-afterhostapd.sh
done < /home/pi/Desktop/BlockerFiles/afterhostapd.sh

## ipforward.sh
echo > /home/pi/Desktop/BlockerFiles/temp-run/run-ipforward.sh
while IFS= read -r line; do
    lineedit="$line"
    lineedit=$(echo "$lineedit" | sed "s/replaceme/$interface/g")
    lineedit=$(echo "$lineedit" | sed "s/maininterface/$interfacemain/g")
    echo $lineedit >> /home/pi/Desktop/BlockerFiles/temp-run/run-ipforward.sh
done < /home/pi/Desktop/BlockerFiles/ipforward.sh




#make sure dnsmasq is not already running
sudo pkill dnsmasq

# PUT REALTEK into Monitor Mode
echo "starting mon.sh ..." #  >> /home/pi/Desktop/allinone.log
sudo bash /home/pi/Desktop/BlockerFiles/temp-run/run-mon.sh#  >> /home/pi/Desktop/allinone.log

# Start AP
echo "starting hostapd ..." #  >> /home/pi/Desktop/allinone.log
sudo hostapd /home/pi/Desktop/BlockerFiles/temp-run/hostapd.conf -B#  >> /home/pi/Desktop/allinone.log

# set up DNS
echo "starting afterhostapd.sh ..." #  >> /home/pi/Desktop/allinone.log
sudo bash /home/pi/Desktop/BlockerFiles/temp-run/run-afterhostapd.sh#  >> /home/pi/Desktop/allinone.log

# set up IP forwarding
echo "starting ipforward.sh ..." #  >> /home/pi/Desktop/allinone.log
sudo bash /home/pi/Desktop/BlockerFiles/temp-run/run-ipforward.sh#  >> /home/pi/Desktop/allinone.log

echo "################################################################ END ###################################################"#  >> /home/pi/Desktop/allinone.log
