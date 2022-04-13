# SD-WAN dual hub adaptive forward error correction - Branches

This configuration is to enable adaptive FEC on the branches. Forward Error Correction (FEC) is used to control and correct errors in data transmission by sending redundant data across the VPN in anticipation of dropped packets occurring during transit. The mechanism sends out x number of redundant packets for every y number of base packets.

FEC is enabled on the desired firewall policy.

Mappings are set up with desired FEC parameters.

FEC mapping is applied to IPsec phase 1 tunnel settings and FEC is enabled on ingress and egress.

A health check server is selected to monitor packet loss on a given overlay.

For more details on adaptive FEC, please see the [Adaptive Forward Error Correction](https://docs.fortinet.com/document/fortigate/7.0.5/administration-guide/169010/adaptive-forward-error-correction) chapter of the FortiGate admin guide.

# Assumptions

The following settings are specific to the demo and should be changed to fit your environment as necessary.

1) A custom application service is defined as udp port 5000. This should be adjusted to meet your business' needs.

2) Thresholds and settings for FEC should be tuned to the application and business needs. In this configuration, FEC parity bits were adjusted to be more aggressive during higher packet loss situations than the defaults.


# Changes between branches

None.
