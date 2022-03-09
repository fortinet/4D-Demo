# SD-WAN single hub with VPN overlay and BGP routing - HUB
------------

This configuration is for a single hub functioning as an access point for datacenter resources. As such, there is no consideration for traffic initiated from the hub.

For more details on SD-WAN rules, please see the [SD-WAN rules](https://docs.fortinet.com/document/fortigate/7.0.5/administration-guide/716691/sd-wan-rules) chapter of the FortiGate admin guide. 

The datacenter's subnet of 192.168.1.0/24 is learned through an eBGP peering with 172.16.1.1. This eBGP route to 192.168.1.0/24 is automatically distributed among all iBGP neighbors in the same Autonomous System without any further configuration.

The network 172.16.100.1/32 is distributed so the iBGP neighbors know of the loopback interface.

# Assumptions
-------------

The following settings are specific to the demo and should be changed to fit your environment as necessary.

1) IPsec settings, such as phase1 proposal and PSK.

2) port1 and port2 are used for WAN1 and WAN2 respectively. Replace them with the ports you use for your WAN connections.

3) The datacenter uses the local subnet 192.168.1.0/24. Adjust the "Datacenter" object to match your LAN subnet.