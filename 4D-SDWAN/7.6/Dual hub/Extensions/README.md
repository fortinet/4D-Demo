# SD-WAN Dual Hub Extensions

This directory contains two optional extensions for dual hub SD-WAN deployments:

## Adaptive Forward Error Correction (FEC)
Forward Error Correction (FEC) is used to control and correct errors in data transmission by sending redundant data across the VPN in anticipation of dropped packets occurring during transit. The mechanism sends out x number of redundant packets for every y number of base packets. Adaptive FEC considers link conditions and dynamically adjusts the FEC packet ratio.

See https://docs.fortinet.com/document/fortigate/7.6.7/administration-guide/169010/adaptive-forward-error-correction for more details.

## Packet Duplication
SD-WAN duplication rules can specify SD-WAN service rules to trigger packet duplication. This allows the duplication to occur based on an SD-WAN rule instead of the source, destination, and service parameters in the duplication rule.

See https://docs.fortinet.com/document/fortigate/7.6.7/administration-guide/813561/duplicate-packets-on-other-zone-members for more details.