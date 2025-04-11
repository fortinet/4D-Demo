# SD-WAN dual hub ADVPN - Branches

This configuration is to enable ADVPN on the branches. ADVPN (Auto Discovery VPN) is an IPsec technology that allows a traditional hub-and-spoke VPN’s spokes to establish dynamic, on-demand, direct tunnels between each other to avoid routing through the topology's hub device.

The spoke overlays are setup as ADVPN receivers. This includes IPsec phase 1 and BGP neighbor settings.

SD-WAN rules are modified to steer Branch-NET traffic across the ADVPN dynamic tunnels.

Firewall policies are modified to permit Branch to Branch traffic.

For more details on ADVPN and SD-WAN, please see the [ADVPN and shortcut paths](https://docs.fortinet.com/document/fortigate/7.0.5/administration-guide/985659/advpn-and-shortcut-paths) chapter of the FortiGate admin guide. 

# Assumptions

The following settings are specific to the demo and should be changed to fit your environment as necessary.

1) Firewall policy ID 3 is created and must not previously exist.


# Changes between branches

None.
