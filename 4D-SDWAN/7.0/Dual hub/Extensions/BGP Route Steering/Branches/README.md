# SD-WAN dual hub BGP route steering - Branches

This configuration is to enable BGP route steering on a branch. As SD-WAN intelligence affects which WAN interface is used, BGP can be leveraged to communicate these decisions to it's neighbors.

Hub1 and hub2 health checks will be monitored the performance of our datacenter overlays. If an SLA fails or does not meet its minimum requirements, it will trigger its BGP neighbor to send a different route map. 

Under normal conditions (SLA are passing), the 'routemap-out-preferable' will be sent out to the HUB BGP neighbor. This routemap is our preferred routemap that matches our LAN addresses with a specified community # (in this example 1 for VPN 1 interfaces or 2 for VPN 2 interfaces). 

An SLA failure will remove the 'routemap-out-preferable' option and use the default routemap-out option. This default routemap tags LAN traffic with a community 5 to indicate it is out of SLA for this given interface. 

For more details on controlling traffic with BGP route steering, please see the [controlling traffic with BGP route mapping](https://docs.fortinet.com/document/fortigate/7.0.5/administration-guide/256748/controlling-traffic-with-bgp-route-mapping-and-service-rules) chapter of the FortiGate admin guide. 

# Assumptions

The following settings are specific to the demo and should be changed to fit your environment as necessary.

1) The hub will receive bgp community strings of 65000:1, 65000:2, and 65000:5.


# Changes between branches

The router access-list uses the LAN subnet of a given site for the prefix.
