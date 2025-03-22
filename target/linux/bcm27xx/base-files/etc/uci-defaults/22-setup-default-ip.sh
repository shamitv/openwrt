#!/bin/sh
uci set network.lan.ipaddr='192.168.8.1'
uci set network.lan.netmask='255.255.252.0'
uci commit network
exit 0
