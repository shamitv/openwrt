#!/bin/sh

#Create data dir if it does not exist
mkdir -p /data

#Add /data/ directory to sysupgrade.conf so tht data is preserved during upgrades
grep -qxF '/data/' /etc/sysupgrade.conf || echo '/data/' >> /etc/sysupgrade.conf
~
