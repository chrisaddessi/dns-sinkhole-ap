# dns-sinkhole-ap
make a dns-sinkhole on a Raspberry Pi running the Raspberry Pi OS 
###### (Only tested on Raspberry Pi 4 18 MAR 2022)

### Installation
To install:
clone the repository
```bash
git clone https://github.com/chrisaddessi/dns-sinkhole-ap.git
cd dns-sinkhole-ap
```
run the install script
```bash
sudo bash install.sh
```
###### select yes for both iptables prompts
To remove:
```bash
sudo bash uninstall.sh
```
### Connect
Once you have run the install scipt you are now ready to connect. <br />
Wait about 2 minutes and the look for a WiFi network ssid: ```DefaultName```

### Test
Test to see if your dns-sinkhole works ping the domain name an domain listed in ```/usr/share/dns-sinkhole-ap/dns-sinkhole-lists```. ###### do this on a device that is not connected to your dns-sinkhole-ap <br />
```
ping adservice.google.com
```
This is the result you should get an ip of one of google servers.
```
Pinging adservice.google.com [172.217.10.98] with 32 bytes of data:
Reply from 172.217.10.98: bytes=32 time=7ms TTL=115
Reply from 172.217.10.98: bytes=32 time=7ms TTL=115
Reply from 172.217.10.98: bytes=32 time=8ms TTL=115
Reply from 172.217.10.98: bytes=32 time=8ms TTL=115
Reply from 172.217.10.98: bytes=32 time=8ms TTL=115
...
```
Now connect to the dns-sinkhole-ap and do the same.
```
ping adservice.google.com
```
As you can see the IP address that is showing is whatever IP is set in one of the dns-sinkhole list files.
So, a dns-sinkhole is just giving out non-routable IP address. This is good for blocking advertisement domains as well as domains associated with malware.
```
Pinging adservice.google.com [127.0.0.1] with 32 bytes of data:
Reply from 127.0.0.1: bytes=32 time<1ms TTL=128
Reply from 127.0.0.1: bytes=32 time<1ms TTL=128
Reply from 127.0.0.1: bytes=32 time<1ms TTL=128
Reply from 127.0.0.1: bytes=32 time<1ms TTL=128
Reply from 127.0.0.1: bytes=32 time<1ms TTL=128
...
```
###### Try adding an entry of a popular website to the lists and replace the non-routable IP with another one.

## Other Features
### Web Portal Management
There is a web portal to manage the dns-sinkhole AP (Access Point) name at the gateway on port 8080. 
```
192.168.1.254:8080
```
This web portal allows for the ability to change the AP name and if the proper drivers are installed a separate network card can be used as the broadcast interface and the onboard NIC used as the source connected to the internet. <br />
###### The web portal is designed using php.


### DNS-sinkhole-get.py
This script is a tool to get lists from websites with the follow format for domains.
##### The format must be as follows for it to work with dnsmasq
###### ip[space]domain.name
```
0.0.0.0 domain.name
127.0.0.1 domain.com
```

## How It Works
This set of scripts works by utilizing:<br />
-dnamasq: for dns and dhcp<br />
-hostapd: for creation of wifi acess point<br />
-crontab: to start the program on reboot<br />
-iptables-persistent: to bridge the network traffic across interfaces<br />

## Not Complete!
Yes. I left this as an unfinished product for the purpose of others and my friends to build off of. Otherwise how would they learn the compoents if it was built like something you would buy off the self.


