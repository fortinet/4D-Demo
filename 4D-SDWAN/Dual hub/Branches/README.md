# SD-WAN dual hub with VPN overlay and BGP routing - Branches

This configuration is for branches connecting back to dual hubs to access internal resources. There is also a local internet breakout so the branches may access public internet resources directly.

For more details on SD-WAN rules, please see the [SD-WAN rules](https://docs.fortinet.com/document/fortigate/7.0.5/administration-guide/716691/sd-wan-rules) chapter of the FortiGate admin guide. 

# Assumptions

The following settings are specific to the demo and should be changed to fit your environment as necessary.

1) IPsec settings, such as phase1 proposal and PSK.

2) port1 and port2 are used for WAN1 and WAN2 respectively. Replace them with the ports you use for your WAN connections.

3) A health-check server is used to measure SLA. You should adjust this to better reflect your traffic of interest by defining your own performance SLA. Please see the [performance SLA](https://docs.fortinet.com/document/fortigate/7.0.5/administration-guide/584396/performance-sla) chapter of the FortiGate admin guide. 

4) WAN2 is the less preferred link and should only be used if WAN1 does not meet SLA.
This applies to the VPN connections overlaying each WAN link. If the health-check to the DC over WAN1-VPN1 fails to meet SLA, traffic may take WAN2-VPN1 to the DC.

5) The branches uses the local subnets 10.1.0.0/16. Adjust the "Branch-NET" object to match your LAN subnet.

6) The VPN dialup gateways (HUB WAN interfaces) are statically configured IP addresses that will need to be changed to match your hub's public WAN IP addresses.
7) BGP AS number is 65000 and the router ID is the loopback interface's ID: 172.16.200.x where x is unique to the branch.

# Changes between branches

1) LAN subnet.

2) Loopback interface IP address.

3) BGP router ID (uses loopback address).

4) IPsec phase1-interface local-id.
