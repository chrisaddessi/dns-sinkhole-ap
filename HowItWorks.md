# Learning About How This All Works:
## Creating the Wireless Acess Point (AP)
To do this I chose to use the ```hostapd``` package.
hostapd.conf
```
#THIS MAKES A AP WITH NO PASSWORD CALLED "AP NAME"
interface=wlan0
driver=nl80211
ssid=AP Name
hw_mode=g
channel=6

macaddr_acl=0
auth_algs=1
ignore_broadcast_ssid=0
```
Then to run the hostapd.conf file ```hostapd hostapd.conf```

## Create DNS,DHCP
You will notice that if you try to connect to the AP you can't. 
In order to connect to the AP we need a DHCP server to give a new IP address to each connecting device.

