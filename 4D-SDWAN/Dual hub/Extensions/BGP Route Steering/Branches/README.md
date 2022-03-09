# SD-WAN dual hub BGP route steering - Branches

This configuration is to enable BGP route steering on a branch. As SD-WAN intelligence affects which WAN interface is used, BGP can be leveraged to communicate these decisions to it's neighbors.

For more details on controlling traffic with BGP route steering, please see the [controlling traffic with BGP route mapping](https://docs.fortinet.com/document/fortigate/7.0.5/administration-guide/256748/controlling-traffic-with-bgp-route-mapping-and-service-rules) chapter of the FortiGate admin guide. 

# Assumptions
-------------

The following settings are specific to the demo and should be changed to fit your environment as necessary.

1) The hub will receive bgp community strings of 65000:1, 65000:2, and 65000:5.


# Changes between branches
-------------
The router access-list uses the LAN subnet of a given site for the prefix.