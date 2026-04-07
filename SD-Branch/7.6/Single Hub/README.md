# SD-Branch demonstration configuration (4-D)

4-D Demo configurations are a collection of configurations which complement the preceeding 3 Ds: Define, Design, and Deploy. This configration is an example of what a SD-Branch implementations might look like.

For further details on SD-Branch features and deployment methods, such as using FortiManager to manage your configuration and deployment, please see the [SD-WAN section](https://docs.fortinet.com/sdwan/7.6) of our document library.

# Overview
This directory contains configuration to enable SD-WAN and configure a switch and AP to be used for branch LAN access. This configuration compliments the [SD-Branch deployment guide](https://docs.fortinet.com/document/fortimanager/7.6.5/single-hub-sd-branch-deployment/772176/introduction).

## Hub
This configuration is for a single hub functioning as access points for datacenter resources. For more details on SD-WAN rules, please see the SD-WAN rules chapter of the FortiGate admin guide.

The following configuration requires edits to fit your environment. These include, but are not limited to:


1. IPsec settings, such as phase1 proposal and PSK

2. port1 and port2 are used for WAN1 and WAN2 respectively. Replace them with the ports you use for your WAN connections, and update the address configuration to reflect your environment.

3. Default routes must be updated to reflect WAN1/2 interface addresses.

4. The datacenter uses the local subnet 192.168.1.0/24. Adjust the "Datacenter-LAN" object to match your LAN subnet.

5. ADVPN is enabled.

6. If your branch subnets cannot be easily summarized, you can configure multiple network prefixes in bgp for each: See the FortiGate Admin Guide for a complete example.
```
config router bgp 
    config network 
        edit 10 
            set prefix 10.1.1.0 255.255.255.0 
        next 
        edit 11 
            set prefix 172.200.99.0 255.255.255.0 
        next
    end
end
```
Alternatively, you can utilize default routes on the branch devices to direct traffic to the hubs.

7. The datacenter's subnet of 192.168.1.0/24 is learned through an eBGP peering with 172.16.1.1. The eBGP route to 192.168.1.0/24 is automatically distributed among all iBGP neighbors in the same Autonomous System without any further configuration.

8. The Hub's BGP loopback (172.16.255.252/32) is installed as a static route on the branch devices once the VPN overlays are established. This is done via an IKE extension: set exchange-ip-addr4 172.16.255.252.

9. The HUB utilizes a blackhole static route for branch summary (10.1.0.0/16). This allows the hubs to advertise the branch summary via BGP to all the branches when combined with:
```
config router bgp 
    config network 
        edit 2 
            set prefix 10.1.0.0 255.255.0.0
```
## Branch
The following settings are specific to the demo and should be changed to fit your environment as necessary.

1. No security configuration is provided and must be considered for any implementation.

2. IPsec settings, such as phase1 proposal and PSK.

3. port1 and port2 are used for WAN1 and WAN2 respectively. Replace them with the ports you use for your WAN connections.

4. Static routes are configured for the two WAN connections.

5. A health-check server is used to measure SLA. You should adjust this to better reflect your traffic of interest by defining your own performance SLA. Please see performance SLA chapter of the FortiGate admin guide.

6. WAN2 is the less preferred link and should only be used if WAN1 does not meet SLA. This applies to the VPN connections overlaying each WAN link. If the health-check to the DC over WAN1-VPN1 fails to meet SLA, traffic may take WAN2-VPN1 to the DC.

7. Branches use the local subnet 10.1.x.0/24 where x is the branch number. Adjust the "Branch-LAN" object to match your LAN subnet.

8. The VPN dialup gateways (HUB WAN interfaces) are statically configured IP addresses that will need to be changed to match your hub's public WAN IP addresses.

9. BGP AS number is 65000 and the router ID is the loopback interface's ID: 172.16.0.x where x is unique to the branch.

10. ADVPN has been enabled.

11. The managed switch serial number will need to be adjusted to match your switch.

12. The managed AP serial number will need to be adjusted to match your AP.

13. Switchports may need to be adjusted if the model is different.

14. Switchport VLANs may need to be changed to suit your needs.

### Changes between branches
1. LAN subnet.

2. Loopback interface IP address.

3. BGP router ID (uses loopback address).

4. IPsec phase1-interface local-id.

# Topology
![SD-Branch](./SD-Branch_Deployment_Guide_topology_intro.png?raw=true "SD-Branch") 
![SD-Branch](./SD-Branch_Deployment_Guide_topology_intro.png?raw=true "SD-Branch") 

# How to
Review the assumptions section and make the necessary changes to the configuration to match your deployment.

Install the updated configuration file to your branches and hub.


# Disclaimers

These configurations are for SD-Branch and related aspects, such as policies, address objects, BGP, IPsec. This configuration alone does not provide sufficient security for a given location. Please review [FortiGate Best Practices](https://docs.fortinet.com/document/fortigate/7.6.99/best-practices/587898/getting-started) and [FortiGate Admin Guide](https://docs.fortinet.com/document/fortigate/7.6.99/administration-guide/954635/getting-started) to compliment this deployment.

Underlay routing is assumed to be present. No consideration is given for FortiGate internet reachability. It is assumed that the branches and hub have full internet connectivity and public IP addresses. 