# SD-WAN single hub with VPN overlay and BGP routing - Branches

This configuration is for branches connecting back to a single hub to access internal resources. There are three local internet breakout rules to steer important traffic over the best link as well as non-critical out the less preferred link.

For more details on SD-WAN rules, please see  the [SD-WAN rules](https://docs.fortinet.com/document/fortigate/7.6.99/administration-guide/716691/sd-wan-rules) chapter of the FortiGate admin guide.

# Assumptions

The following settings are specific to the demo and should be changed to fit your environment as necessary.

1) No security configuration is provided and must be considered for any implementation.

2) IPsec settings, such as phase1 proposal and PSK.

3) port1 and port2 are used for WAN1 and WAN2 respectively. Replace them with the ports you use for your WAN connections.

4) Static routes are configured for the two WAN connections.

5) A health-check server is used to measure SLA. You should adjust this to better reflect your traffic of interest by defining your own performance SLA. Please see [performance SLA](https://docs.fortinet.com/document/fortigate/7.6.99/administration-guide/584396/performance-sla) chapter of the FortiGate admin guide.

6) WAN2 is the less preferred link and should only be used if WAN1 does not meet SLA.
This applies to the VPN connections overlaying each WAN link. If the health-check to the DC over WAN1-VPN1 fails to meet SLA, traffic may take WAN2-VPN1 to the DC.

7) Branches use the local subnet 10.1.x.0/24 where x is the branch number. Adjust the "Branch-LAN" object to match your LAN subnet.

8) The VPN dialup gateways (HUB WAN interfaces) are statically configured IP addresses that will need to be changed to match your hub's public WAN IP addresses.

9) BGP AS number is 65000 and the router ID is the loopback interface's ID: 172.16.0.x where x is unique to the branch.

10) ADVPN has been enabled.

# Changes between branches

1) LAN subnet.

2) Loopback interface IP address.

3) BGP router ID (uses loopback address).

4) IPsec phase1-interface local-id.