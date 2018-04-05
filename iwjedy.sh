#!/bin/bash
sudo ifconfig ra0 up
# sudo iwpriv ra0 set NetworkType=Adhoc
sudo iwpriv ra0 set NetworkType=Infra
sudo iwpriv ra0 set AuthMode=WPA2PSK
sudo iwpriv ra0 set EncrypType=AES
sudo iwpriv ra0 set SSID="Jedy's iPhone"
sudo iwpriv ra0 set WPAPSK=iamarock
sudo iwpriv ra0 set SSID="Jedy's iPhone"

sudo iwpriv ra0 connStatus

# sudo iwlist ra0 scanning
# sudo iwpriv ra0 connStatus

