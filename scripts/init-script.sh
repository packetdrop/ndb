#!/bin/sh

echo "Welcome to Network Debugging Container. This container contains tools
to help debugging the networking related issues." `date`

echo " List of tools currently installed:
# net-tools (ifconfig )
# traceroute
# ethtool
# mtr
# iperf
#  nmap
# strace
# socat
# iproute
# bind-utils (nslookup)
# wireshark
# nmon
# bmon
# openssl
"

if [ "$#" -lt 1 ]; then
  echo " Container is going dead, but don't worry your tap (nic) is still hooked."
else
  echo "Sleeping for $1, enjoy debugging your issue and use the container if you want to leverage the tools this container contains."
  sleep "$1"
fi
