# SD-WAN single hub BGP route steering - HUB

This configuration is to enable BGP route steering on the hub. As SD-WAN intelligence affects which WAN interface is used, BGP can be leveraged to communicate these decisions to it's neighbors.

The hubs have routemaps on incoming neighbors that matches the Branch community # with a specified route-tag. 
-Community 1 or 2 (SLA good) are mapped to route-tag 1 & 2 respectively. 
Community 5 (out of SLA) is mapped to a route-tag 5. 

SD-WAN rules on the HUB are configured to map route-tag 1 with VPN 1 and route-tag 2 with VPN 2. Under normal conditions, Branch traffic will flow through these interfaces (VPN1 first, VPN2 second based on order). 

Upon SLA failure, the incoming community 5 does not match a given rule and goes to the default routing table. 

For more details on controlling traffic with BGP route steering, please see the [controlling traffic with BGP route mapping](https://docs.fortinet.com/document/fortigate/7.0.5/administration-guide/256748/controlling-traffic-with-bgp-route-mapping-and-service-rules) chapter of the FortiGate admin guide. 

# Assumptions

The following settings are specific to the demo and should be changed to fit your environment as necessary.

1) The branches will send bgp community strings of 65000:1, 65000:2, and 65000:5.
