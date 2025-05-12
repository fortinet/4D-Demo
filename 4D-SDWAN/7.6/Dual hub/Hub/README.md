# SD-WAN dual hub with VPN overlay and BGP routing 7.6 - HUBs

This configuration is for dual hubs functioning as access points for datacenter resources. 

For more details on SD-WAN rules, please see the [SD-WAN rules](https://docs.fortinet.com/document/fortigate/7.6.99/administration-guide/716691/sd-wan-rules) chapter of the FortiGate admin guide. 

The datacenter's subnet of 192.168.1.0/24 is learned through an eBGP peering with 172.16.1.1, and 172.16.2.1 for Hub1 and Hub2 respectively. The eBGP route to 192.168.1.0/24 is automatically distributed among all iBGP neighbors in the same Autonomous System without any further configuration.

Each Hub's BGP loopback (HUB1: 172.16.255.252/32, HUB2: 172.16.255.250) is installed as a static route on the branch devices once the VPN overlays are established. This is done via an IKE extension: set exchange-ip-addr4 $Hub-Lo.

Hubs share the same IP address for their HUB_HC loopback interface to simplify branch health check configuration.

HUBs utilize a blackhole static route for branch summary (10.1.0.0/16). This allows the hubs to advertise the branch summary via BGP to all the branches when combined with:

config router bgp
    config network
        edit 10
            set prefix 10.1.0.0 255.255.0.0
            
            

# Assumptions

The following settings are specific to the demo and should be changed to fit your environment as necessary.

1) IPsec settings, such as phase1 proposal and PSK

2) port1 and port2 are used for WAN1 and WAN2 respectively. Replace them with the ports you use for your WAN connections, and update the address configuration to reflect your environment.

3) Default routes must be updated to reflect WAN1/2 interface addresses.

3) The datacenter uses the local subnet 192.168.1.0/24. Adjust the "Datacenter-LAN" object to match your LAN subnet.

4) If your branch subnets cannot be easily summarized, you can configure multiple network prefixes in bgp for each:
See the [FortiGate Admin Guide](https://docs.fortinet.com/document/fortigate/7.6.99/administration-guide/63589/active-dynamic-bgp-neighbor-triggered-by-advpn-shortcut) for a complete example.


config router bgp
    config network
        edit 10
            set prefix 10.1.1.0 255.255.255.0
        next
        edit 11
            set prefix 172.200.99.0 255.255.255.0
        end
        
Alternatively, you can utilize default routes on the branch devices to direct traffic to the hubs.