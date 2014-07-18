#Outline:

1. Check for available (up) interfaces (Ethernet or Wifi)
   [Assumption: One interface is only in the up state at a given time]
2. Connect to CITES UIUC VPN
3. Once connected to the VPN, route all traffic through the VPN (tun0) interface
