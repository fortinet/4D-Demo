# SD-WAN dual hub ADVPN - HUB

This configuration is to enable ADVPN on the hub. ADVPN (Auto Discovery VPN) is an IPsec technology that allows a traditional hub-and-spoke VPN’s spokes to establish dynamic, on-demand, direct tunnels between each other to avoid routing through the topology's hub device.

The hub VPN overlays are set up to be an ADVPN senders. This includes IPsec phase 1 and BGP neighbor settings to allow for 4 additional paths to be sent to each of the overlays.

Policy routes are created for ADVPN "stickiness". Stickyness is required to prevent private links from receiving public link shortcuts. For example if one link was a public ISP connection and the other is a private MPLS line.

The firewall policies are modified to permit Branch to Branch traffic.

For more details on ADVPN and SD-WAN, please see the [ADVPN and shortcut paths](https://docs.fortinet.com/document/fortigate/7.0.5/administration-guide/985659/advpn-and-shortcut-paths) chapter of the FortiGate admin guide. 

# Assumptions

The following settings are specific to the demo and should be changed to fit your environment as necessary.

1) A firewall policy with ID 5 is created and must not previously exist.
