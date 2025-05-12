# SD-WAN Dual Hub

This directory contains configuration to enable SD-WAN for two Hubs and two spokes using Dynamic BGP on Loopback with ADVPN 2.0.

In addition to the configuration files, there are topology diagrams provided in .png format, and .drawio format should you wish to edit or build upon the given topology.

# Topology

### Underlay
This diagram provides the physical ports used by the topologies, as well as some key IP addresses and networks.
![Dual hub branch underlay](./DH_SD_Underlay_76.png?raw=true "Underlay") 

### IPsec Overlay
This is the first step of the overlay to indicate the various IPSec VPN tunnels that are established over the underlay. The diagram associates the tunnel paths with the naming convention.
![Dual hub branch overlay IPsec](./DH_SD_IPSec_76.png?raw=true "IPsec Overlay") 

### BGP Overlay
This topology builds on the IPSec overlay topology to indicate how BGP settings on the hub and branch devices are selected.
![Dual hub branch overlay BGP](./DH_SD_bgp_76.png?raw=true "BGP Overlay") 
