# dns-sinkhole-ap
make a dns sinkhole on a raspberry pi running the rasberry pi os 

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

## Other Features
### DNS-sinkhole-get.py
This is a tool to get lists from the internet.
##### The format must be as follows for it to work with dnsmasq
###### ip[space]domain.name
```
0.0.0.0 domain.name
127.0.0.1 domain.com
```

## How It Works
This set of scripts works by utilizing:
-dnamasq: for dns and dhcp
-hostapd: for creation of wifi acess point
-crontab: to start the program on reboot
-iptables-persistent: to bridge the network traffic across interfaces

## Not Complete!
Yes. I left this as an unfinished product for the purpose of others and my friends to build off of. Otherwise how would they learn the compoents if it was built like something you would buy off the self.

# Learning About How This All Works:
## Creating the Wireless Acess Point (AP)
To do this I chose to use the ```hostapd``` package
