#!/bin/bash

sudo rm -rf /usr/bin/dns-sinkhole-ap /usr/share/dns-sinkhole-ap
sudo cat /var/spool/cron/crontabs/root | sudo sed 's/@reboot\ssleep\s60\s&&\ssudo\s\/usr\/bin\/bash\s\/usr\/bin\/dns-sinkhole-ap//g' > /tmp/tmpfile && sudo mv /tmp/tmpfile /var/spool/cron/crontabs/root
sudo chown root:crontab /var/spool/cron/crontabs/root
sudo chmod 600 /var/spool/cron/crontabs/root
#set crontab permissions back to what they where

