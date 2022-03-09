# SD-WAN dual hub ADVPN - Branches
------------

This configuration is to enable ADVPN on the branches. Forward Error Correction (FEC) is used to control and correct errors in data transmission by sending redundant data across the VPN in anticipation of dropped packets occurring during transit. The mechanism sends out x number of redundant packets for every y number of base packets.

For more details on ADVPN and SD-WAN, please see the [ADVPN and shortcut paths](https://docs.fortinet.com/document/fortigate/7.0.5/administration-guide/985659/advpn-and-shortcut-paths) chapter of the FortiGate admin guide. 

# Assumptions
-------------

The following settings are specific to the demo and should be changed to fit your environment as necessary.

1) Firewall policy ID 3 is created and must not previously exist.


# Changes between branches
-------------
None.