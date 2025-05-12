# SD-WAN dual hub with VPN overlay and BGP routing 7.6 - Branches

This configuration is for branches connecting back to dual hubs to access internal resources. There are three local internet breakout rules to steer important traffic over the best link as well as non-critical out the less preferred link.

For more details on SD-WAN rules, please see the [SD-WAN rules](https://docs.fortinet.com/document/fortigate/7.6.99/administration-guide/716691/sd-wan-rules) chapter of the FortiGate admin guide. 

# Assumptions

The following settings are specific to the demo and should be changed to fit your environment as necessary.

1) No security configuration is provided and must be considered for any implementation.

2) IPsec settings, such as phase1 proposal and PSK.

3) port1 and port2 are used for WAN1 and WAN2 respectively. Replace them with the ports you use for your WAN connections.

4) A health-check server is used to measure SLA. You should adjust this to better reflect your traffic of interest by defining your own performance SLA. Please see the [performance SLA](https://docs.fortinet.com/document/fortigate/7.6.99/administration-guide/584396/performance-sla) chapter of the FortiGate admin guide. 

5) WAN2 is the less preferred link and should only be used if WAN1 does not meet SLA.
This applies to the VPN connections overlaying each WAN link. If the health-check to the DC over WAN1-VPN1 fails to meet SLA, traffic may take WAN2-VPN1 to the DC.

6) HUB1 is the preferred HUB and should be used unless the VPN links to HUB1 are out of SLA.

7) The branches uses the local subnets 10.1.x.0/24, where x is the branch number. The "Branch-LAN" is a supernet that comprises all the branch LAN networks (10.1.0.0/16). 

8) The WAN interfaces for branch devices are statically configured and will need to be adjusted to match your environment, along with default routes for each WAN interface.

9) BGP AS number is 65000 and the router ID is the loopback interface's ID: 172.16.0.x where x is unique to the branch.

# Changes between branches

1) LAN subnet.

2) Loopback interface IP address.

3) BGP router ID (uses loopback address).

4) IPsec phase1-interface localid.