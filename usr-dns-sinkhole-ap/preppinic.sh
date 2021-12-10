#!/bin/bash
echo 'ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev' > /etc/wpa_supplicant/wpa_supplicant.conf
echo 'update_config=1' >> /etc/wpa_supplicant/wpa_supplicant.conf
echo 'country=US' >> /etc/wpa_supplicant/wpa_supplicant.conf
