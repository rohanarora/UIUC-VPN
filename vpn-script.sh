#!/bin/sh
PASSWORD=$(eval "gpg --decrypt .my-illinois.gpg")
echo "Password is: "$PASSWORD

sudo openconnect -b --script ./vpnc-script -u arorar -p $PASSWORD --authgroup=SplitTunnel vpn.cites.illinois.edu

UP_INTERFACE=$(eval "ip a | grep -E 'state UP'| awk '{print \$2}' | sed 's/.\{1\}$//'")
echo "Up Interface: "$UP_INTERFACE
#sudo ip route del default dev $UP_INTERFACE

VPN_INTERFACE=$(eval "ip a | grep -E 'POINTOPOINT'| awk '{print \$2}' | sed 's/.\{1\}$//'")
echo "VPN Interface: "$VPN_INTERFACE
sudo ip route add default dev $VPN_INTERFACE
#sudo ip route add default dev tun0
