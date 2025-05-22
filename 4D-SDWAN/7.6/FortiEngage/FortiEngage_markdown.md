# SD-WAN Dual Hub using Dynamic BGP on Loopback with ADVPN2.0

This directory includes all the scripts, topology diagrams, and sample CSV files to deploy the [Dual Hub primary/secondary SD-WAN architecture](https://docs.fortinet.com/document/fortigate/7.2.0/sd-wan-architecture-for-enterprise/644109/multiple-datacenters-primary-secondary-gateways), as described in the [SD-WAN Architecture for Enterprise guide](https://docs.fortinet.com/document/fortigate/7.2.0/sd-wan-architecture-for-enterprise/342022/introduction). 

## Topology

![Topology](https://github.com/fortiengage/sdwan/blob/main/dualhub-primary-secondary/topo.png?raw=true "Topology")

As illustrated in the topology, two hubs are deployed in different locations for redundancy purposes. Two branch sites connect ot the hubs to access applications hosted in the datacenter as well as applications hosted at each branch site.

The primary hub is preferred, such that traffic will pass through the primary hub as long as one of the WAN links are considered "alive" by SD-WAN. Traffic will failover to the secondary hub when both WAN links are dead or out of SLA.


## Audience? 

- Who is the audience? SEs? CSEs?


## Design overview (exec summary)

The deployment involves a greenfield rollout of Fortinet Secure SD-WAN devices, with hub FortiGates strategically positioned in private locations such as headquarters, data centers, or cloud environments. These hubs serve as the secure gateway for remote branch locations, enabling access to essential local applications and services. Each branch establishes four SD-WAN overlay VPN connections to the hub’s WAN interfaces, ensuring robust connectivity. Traffic is efficiently directed across links using SD-WAN rules, while performance SLAs help assess link suitability for specific application needs. BGP routing facilitates seamless communication across the network, and ADVPN enhances branch-to-branch connectivity. 


## Main Components

This SD-WAN implementation leverages three key features or components. These components are in addition to the SD-WAN secure, reliable, and scalable connectivity across various locations while centralizing management and visibility over the network.

### Dynamic BGP

Dynamic BGP allows for branch FortiGates to form a BGP neighbor adjacency with other branch FortiGates once an ADVPN tunnel shortcut has been established. This means that the hub FortiGates do not have to reflect branch networks from one branch to the rest, resulting in lower resource utilization on the hub FortiGates.

### BGP on Loopback

BGP on loopback is when the branch FortiGates to peer with hub FortiGtes using each FortiGate's loopback interface, resulting in one neighbor adjacency between the branch and hub. This is in contrast to BGP per overlay where the BGP adjacencies are formed for each overlay, resulting in several neighbor adjacencies for each branch and spoke.

### ADVPN 2.0

ADVPN 2.0 allows branches to make a more informed decision about which underlay to form ADVPN shortcut tunnels over. Edge discovery provides the initiating branch the ability to learn the status of the receiving branch's WAN links, enabling the best performing link to be used, as well as the ability to build new shortcuts to ensure the best link is always being used.

## Prerequisites

The following prerequesites define required FortiGate and FortiManager configuration that is not provided by FortiEngage:

- FortiGates are on 7.6.3 or higher
- FortiManager is 7.6.4 or higher
- Both the hubs and branches have been added to FortiManager, and have an active management connection
- Each hub has two redundant WAN connections
- Each branch has two redundant WAN connections
- WAN connections are public links that can reach all other device WAN interfaces in the region


## Planning

When planning a SD-WAN deployment, the following settings must be considered and planned for.


### Loopback IP address space

Hub devices utilize two loopbacks:

- HUB-Lo
	- Used for health checks from branch devices to measure VPN tunnel performance.
	- Each hub will use the same IP address for this loopback interface. 
- BGP-Lo
	- Used for BGP peering between branch and hub devices.
	- Interface IP must be unique for each hub.
	
Branch devices utilize one loopback:

- Branch-Lo
	- Used to form BGP peering with hubs and other branches when ADVPN shortcuts are established.

It is recommended to use a loopback subnet that can contain all the branch and hub loopbacks.

Example use of 172.16.0.0/16:
- 172.16.0.#/32 can be used for branch loopbacks
- 172.16.255.254/32 can be used for HUB-Lo on both hubs
- 172.16.255.253/32 can be used for BGP-Lo for Hub1
- 172.16.255.252/32 can be used for BGP-Lo for Hub2

### Autonomous System number for BGP
	
A private number is used and must remain exclusively for this SD-WAN BGP configuration.

### Branch LAN IP address space

Branches should use subnets that can be readily supernetted, or summarized by a larger subnet. For example:

Branch1: 10.1.1.0/24
Branch2: 10.1.2.0/24
...
Branch10: 10.1.10.0/24

These branch subnets may be summarized with the supernet: 10.1.0.0/16.

This is useful for advertising branch LAN reachability from the hub.

[Note] This is not strictly necessary. When branch LANs are not easily summarized by one or a few routes from the hub, default routes may be implemented on each branch to direct non-internet destined traffic to the hub.


# Example configuration

The below topologies show an example use case for this deployment. The two provided sample .csv files, device_info_sample.csv and sdwan_overlay_info_sample.csv, can be used "as-is" to generate a working SD-WAN configuration.

This implementation utilizes an eBGP peering between the hubs and the datacenter to allow datacenter access from both hubs. The routes learned from this eBGP peering are automatically (by default) re-advertised to all hub iBGP peers. In this case, the branch FortiGates. The datacenter uses AS 65100 to distinguish itself from the HUB/Branch AS of 65000.


## Underlay

This topology shows the interfaces selected for each FortiGate for WAN and LAN links. It also shows that the two hubs provide access to the datacenter subnet via their LAN (port3) interface.

![Underlay](https://github.com/fortinet/4D-Demo/blob/main/4D-SDWAN/7.6/Dual%20hub/DH_SD_Underlay_76.png?raw=true "Underlay")

## IPsec Overlay

The IPsec Overlay topology indicates the IPsec tunnels that are formed to provide datacenter access to the branch devices. Note that there is no IP addressing for the VPN tunnels. The tunnels do not require an IP address as they are not used by BGP to establish a neighbor adjacency.

![Overlay](https://github.com/fortinet/4D-Demo/blob/main/4D-SDWAN/7.6/Dual%20hub/DH_SD_IPSec_76.png?raw=true "Overlay")

## BGP

As discussed earlier, BGP is configured to use a FortiGate loopback to establish adjacency with other FortiGates. This is initially a branch to hub adjacency, but will also be utilized when ADVPN shortcuts are established. The configuration snippits described here are provided to indicate how environment settings match with the FortiGate configuration.


![Overlay](https://github.com/fortinet/4D-Demo/blob/main/4D-SDWAN/7.6/Dual%20hub/DH_SD_bgp_76.png?raw=true "BGP")

## Example routing tables

These routing tables show how BGP and static routes enable branch to datacenter communication, as well as branch to branch communication. ADVPN shortcut establishment is also reviewed with regards to the routing table.


### Hub

```
HUB1 # get router info routing table all

S*      0.0.0.0/0 [10/0] via 10.198.5.1, port1, [1/0]
                  [10/0] via 10.198.6.1, port2, [1/0]
S       10.1.0.0/16 [252/0] is a summary, Null, [1/0]
B       10.1.1.0/24 [200/0] via 172.16.0.1 (recursive via VPN1 tunnel 172.16.0.1 [1]), 6d02h10m
                                           (recursive via VPN2 tunnel 10.0.0.4 [1]), 6d02h10m, [1/0]
B       10.1.2.0/24 [200/0] via 172.16.0.2 (recursive via VPN1 tunnel 172.16.0.2 [1]), 6d02h09m
                                           (recursive via VPN2 tunnel 10.0.0.3 [1]), 6d02h09m, [1/0]
C       10.198.5.0/29 is directly connected, port1
C       10.198.6.0/29 is directly connected, port2
S       172.16.0.1/32 [15/0] via VPN1 tunnel 172.16.0.1, [1/0]
                      [15/0] via VPN2 tunnel 10.0.0.4, [1/0]
S       172.16.0.2/32 [15/0] via VPN1 tunnel 172.16.0.2, [1/0]
                      [15/0] via VPN2 tunnel 10.0.0.3, [1/0]
C       172.16.1.0/30 is directly connected, port3
C       172.16.255.252/32 is directly connected, BGP-Lo
C       172.16.255.253/32 is directly connected, HUB1-Lo
B       192.168.1.0/24 [20/0] via 172.16.1.1 (recursive is directly connected, port3), 6d02h14m, [1/0]
```

**Key takeaways for the HUB:**

Both branch LANs are reachable via both VPN tunnels.
```
B       10.1.1.0/24 [200/0] via 172.16.0.1 (recursive via VPN1 tunnel 172.16.0.1 [1]), 6d02h10m
                                           (recursive via VPN2 tunnel 10.0.0.4 [1]), 6d02h10m, [1/0]
B       10.1.2.0/24 [200/0] via 172.16.0.2 (recursive via VPN1 tunnel 172.16.0.2 [1]), 6d02h09m
                                           (recursive via VPN2 tunnel 10.0.0.3 [1]), 6d02h09m, [1/0]
```

Both branch loopbacks are reachable via both VPN tunnels.
```
S       172.16.0.1/32 [15/0] via VPN1 tunnel 172.16.0.1, [1/0]
                      [15/0] via VPN2 tunnel 10.0.0.7, [1/0]
S       172.16.0.2/32 [15/0] via VPN1 tunnel 172.16.0.2, [1/0]
                      [15/0] via VPN2 tunnel 10.0.0.8, [1/0]
```

The branch LAN summary network is added as a static route.
```
S       10.1.0.0/16 [252/0] is a summary, Null, [1/0]
```

The datacenter LAN is reachable via port3.
```
B       192.168.1.0/24 [20/0] via 172.16.1.1 (recursive is directly connected, port3), 6d02h14m, [1/0]
```

### Branch

```
Br1 # get router info routing table all

S*      0.0.0.0/0 [10/0] via 10.198.1.1, port1, [1/0]
                  [10/0] via 10.198.2.1, port2, [1/0]
B       10.1.0.0/16 [200/0] via 172.16.255.250 (recursive via HUB2-VPN1 tunnel 10.198.7.2), 6d02h06m
                                               (recursive via HUB2-VPN2 tunnel 10.198.8.2), 6d02h06m, [1/0]
                    [200/0] via 172.16.255.252 (recursive via HUB1-VPN1 tunnel 10.198.5.2), 6d02h06m
                                               (recursive via HUB1-VPN2 tunnel 10.198.6.2), 6d02h06m, [1/0]
C       10.1.1.0/24 is directly connected, port3
C       10.198.1.0/29 is directly connected, port1
C       10.198.2.0/29 is directly connected, port2
C       172.16.0.1/32 is directly connected, Branch-Lo
S       172.16.255.250/32 [15/0] via HUB2-VPN1 tunnel 10.198.7.2, [1/0]
                          [15/0] via HUB2-VPN2 tunnel 10.198.8.2, [1/0]
S       172.16.255.252/32 [15/0] via HUB1-VPN1 tunnel 10.198.5.2, [1/0]
                          [15/0] via HUB1-VPN2 tunnel 10.198.6.2, [1/0]
B       192.168.1.0/24 [200/0] via 172.16.255.250 (recursive via HUB2-VPN1 tunnel 10.198.7.2), 6d02h06m
                                                  (recursive via HUB2-VPN2 tunnel 10.198.8.2), 6d02h06m, [1/0]
                       [200/0] via 172.16.255.252 (recursive via HUB1-VPN1 tunnel 10.198.5.2), 6d02h06m
                                                  (recursive via HUB1-VPN2 tunnel 10.198.6.2), 6d02h06m, [1/0]
```

**Key takeaways for the Branches:**

The branch summary LAN is reachable via both VPN tunnels to each Hub loopback. 
```
B       10.1.0.0/16 [200/0] via 172.16.255.250 (recursive via HUB2-VPN1 tunnel 10.198.7.2), 6d02h06m
                                               (recursive via HUB2-VPN2 tunnel 10.198.8.2), 6d02h06m, [1/0]
                    [200/0] via 172.16.255.252 (recursive via HUB1-VPN1 tunnel 10.198.5.2), 6d02h06m
                                               (recursive via HUB1-VPN2 tunnel 10.198.6.2), 6d02h06m, [1/0]
```

The HUB loopbacks are reachable via both tunnels to the respective hub.
```
S       172.16.255.250/32 [15/0] via HUB2-VPN1 tunnel 10.198.7.2, [1/0]
                          [15/0] via HUB2-VPN2 tunnel 10.198.8.2, [1/0]
S       172.16.255.252/32 [15/0] via HUB1-VPN1 tunnel 10.198.5.2, [1/0]
                          [15/0] via HUB1-VPN2 tunnel 10.198.6.2, [1/0]
```

The Datacenter LAN (192.168.1.0/24) is reachable via both Hubs across both tunnels.
```
B       192.168.1.0/24 [200/0] via 172.16.255.250 (recursive via HUB2-VPN1 tunnel 10.198.7.2), 6d02h06m
                                                  (recursive via HUB2-VPN2 tunnel 10.198.8.2), 6d02h06m, [1/0]
                       [200/0] via 172.16.255.252 (recursive via HUB1-VPN1 tunnel 10.198.5.2), 6d02h06m
                                                  (recursive via HUB1-VPN2 tunnel 10.198.6.2), 6d02h06m, [1/0]
```

## ADVPN routing table review

The following routing table is observed after initiating a connection from a device on Branch1's LAN (10.1.1.10) to a device on Branch2's LAN (10.1.2.10).

```
Br1 # get router info routing table all

Routing table for VRF=0
S*      0.0.0.0/0 [10/0] via 10.198.1.1, port1, [1/0]
                  [10/0] via 10.198.2.1, port2, [1/0]
B       10.1.0.0/16 [200/0] via 172.16.255.250 (recursive via HUB2-VPN1 tunnel 10.198.7.2), 6d02h10m
                                               (recursive via HUB2-VPN2 tunnel 10.198.8.2), 6d02h10m, [1/0]
                    [200/0] via 172.16.255.252 (recursive via HUB1-VPN1 tunnel 10.198.5.2), 6d02h10m
                                               (recursive via HUB1-VPN2 tunnel 10.198.6.2), 6d02h10m, [1/0]
C       10.1.1.0/24 is directly connected, port3
B       10.1.2.0/24 [200/0] via 172.16.0.2 (recursive via HUB1-VPN1_0 tunnel 172.16.0.2), 00:02:57, [1/0]
C       10.198.1.0/29 is directly connected, port1
C       10.198.2.0/29 is directly connected, port2
C       172.16.0.1/32 is directly connected, Branch-Lo
S       172.16.0.2/32 [15/0] via HUB1-VPN1_0 tunnel 172.16.0.2, [1/0]
S       172.16.255.250/32 [15/0] via HUB2-VPN1 tunnel 10.198.7.2, [1/0]
                          [15/0] via HUB2-VPN2 tunnel 10.198.8.2, [1/0]
S       172.16.255.252/32 [15/0] via HUB1-VPN1 tunnel 10.198.5.2, [1/0]
                          [15/0] via HUB1-VPN2 tunnel 10.198.6.2, [1/0]
B       192.168.1.0/24 [200/0] via 172.16.255.250 (recursive via HUB2-VPN1 tunnel 10.198.7.2), 6d02h10m
                                                  (recursive via HUB2-VPN2 tunnel 10.198.8.2), 6d02h10m, [1/0]
                       [200/0] via 172.16.255.252 (recursive via HUB1-VPN1 tunnel 10.198.5.2), 6d02h10m
                                                  (recursive via HUB1-VPN2 tunnel 10.198.6.2), 6d02h10m, [1/0]
```

Notice there are 2 new entries in the routing table.

This BGP route shows how the Branch2 LAN (10.1.2.0/24) is reachable across the shortcut tunnel (HUB1-VPN1_0) with the next hop of 172.16.0.2 (Branch2’s loopback). 
`B       10.1.2.0/24 [200/0] via 172.16.0.2 (recursive via HUB1-VPN1_0 tunnel 172.16.0.2), 00:02:57, [1/0]`


This static route shows that Branch2’s loopback is reachable via the shortcut tunnel (HUB1-VPN1_0), enabling the branch FortiGate to reach the new BGP route’s next hop.
`S       172.16.0.2/32 [15/0] via HUB1-VPN1_0 tunnel 172.16.0.2, [1/0]`