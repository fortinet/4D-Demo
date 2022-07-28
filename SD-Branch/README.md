# SD-Branch demonstration configuration (4-D)

4-D Demo configurations are a collection of configurations which complement the preceeding 3 Ds: Define, Design, and Deploy. This configration is an example of what a SD-Branch implementations might look like.

For further details on SD-Branch features and deployment methods, such as using FortiManager to manage your configuration and deployment, please see the [SD-WAN section](https://docs.fortinet.com/sdwan/7.0) of our document library.

# Overview
This directory contains configuration to enable SD-WAN and configure a switch and AP to be used for branch LAN access. This configuration compliments the [SD-Branch deployment guide](https://docs.fortinet.com/document/fortigate/7.0.0/sd-wan-sd-branch-deployment-guide/643203/introduction).

# Topology
![SD-Branch](./SD-Branch_Deployment_Guide_topology_intro.png?raw=true "SD-Branch") 

# How to
Review the assumptions section and make the necessary changes to the configuration to match your deployment.

Install the updated configuration file to your branch.

You will need to configure 2 IPSec tunnels on your HUB(s) to match the branch configuration.

# Assumptions
The following configuration requires edits to fit your environment. These include, but are not limited to:

- The WAN ports used are defined as "wan1" and "wan2".
- They are configured to use DHCP.
- FortiLink ports are "a" and "b".
- FortiLink uses a network of 11.255.1.0/24.
- AP management network of 10.190.190.0/24.
- Passphrase for Guest_WIFI and Staff_WIFI is set to "fortinet".
- Guest WIFI network is 10.111.0.1/24.
- Both IPSec tunnels use the psk of "fortinet".
- The managed switch serial number will need to be adjusted to match your switch.
- Switchports may need to be adjusted if the model is different.
- Switchport VLANs may need to be changed to suit your needs.
- The managed AP serial number will need to be adjusted to match your AP.

# Disclaimers

These configurations are for SD-Branch and related aspects, such as policies, address objects, BGP, IPsec. This configuration alone does not provide sufficient security for a given location. Please review [FortiGate Best Practices](https://docs.fortinet.com/document/fortigate/7.0.0/best-practices/587898/getting-started) and [FortiGate Admin Guide](https://docs.fortinet.com/document/fortigate/7.0.5/administration-guide/954635/getting-started) to compliment this deployment.

Underlay routing is assumed to be present. No consideration is given for branch internet reachability. It is assumed that the branch has full internet connectivity and public IP addresses. 