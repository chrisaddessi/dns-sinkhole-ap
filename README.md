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
dnsmasq logs are saved
```bash
/tmp/dnsmaq.conf
```
### DNS-sinkhole-get.py
This is a tool to get lists from the internet.
##### The format must be as follows for it to work with dnsmasq
###### ip[space]domain.name
```
0.0.0.0 domain.name
127.0.0.1 domain.com
```
