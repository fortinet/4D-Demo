# SD-WAN Underlay only
------------

This configuration is for a branch location that wishes to apply some WAN edge intelligence to control how outbound traffic egresses the local area network when destined for the public internet. There are many rules available to help the FortiGate direct the traffic. This example highlights a primary and backup WAN link scenario, where the primary should be used exclusively unless it fails to meet the defined SLA. When that happens, traffic is directed to the backup WAN connection.

For more details on SD-WAN rules, please see the [SD-WAN rules](https://docs.fortinet.com/document/fortigate/7.0.5/administration-guide/716691/sd-wan-rules) chapter of the FortiGate admin guide. 

# Assumptions
-------------

The following settings are specific to the demo and should be changed to fit your environment as necessary.

1) port1 and port2 are used for WAN1 and WAN2 respectively. Replace them with the ports you use for your WAN connections.

2) This branch uses the local subnet 10.1.0.0/24. Adjust the "Branch-NET" object to match your LAN subnet.

3) A health-check server is used to measure SLA. You should adjust this to better reflect your traffic of interest by defining your own performance SLA. Please see the [performance SLA](https://docs.fortinet.com/document/fortigate/7.0.5/administration-guide/584396/performance-sla) chapter of the FortiGate admin guide. 