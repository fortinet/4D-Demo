# SD-Branch demonstration configuration (4-D)

4-D Demo configurations are a collection of configurations which complement the preceeding 3 Ds: Define, Design, and Deploy. This configration is an example of what a SD-Branch implementations might look like.

For further details on SD-Branch features and deployment methods, such as using FortiManager to manage your configuration and deployment, please see the [SD-WAN section](https://docs.fortinet.com/sdwan/7.6) of our document library.

# Overview
This directory contains configuration to enable SD-WAN and configure a switch and AP to be used for branch LAN access. 

# Assumptions
The following settings are specific to the demo and should be changed to fit your environment as necessary.

1. No security configuration is provided and must be considered for any implementation.

2. port1 and port2 are used for WAN1 and WAN2 respectively. Replace them with the ports you use for your WAN connections.

3. Static routes are configured for the two WAN connections.

4. A health-check server is used to measure SLA. You should adjust this to better reflect your traffic of interest by defining your own performance SLA. Please see performance SLA chapter of the FortiGate admin guide.

5. WAN2 is the less preferred link and should only be used if WAN1 does not meet SLA. 

6. Branches use the local subnet 10.1.x.0/24 where x is the branch number. Adjust the "Branch-LAN" object to match your LAN subnet.

7. The managed switch serial number will need to be adjusted to match your switch.

8. The managed AP serial number will need to be adjusted to match your AP.

9. Switchports may need to be adjusted if the model is different.

10. Switchport VLANs may need to be changed to suit your needs.


# How to
Review the assumptions section and make the necessary changes to the configuration to match your deployment.

Install the updated configuration file to your branch.


# Disclaimers

These configurations are for SD-Branch and related aspects, such as policies, address objects, BGP, IPsec. This configuration alone does not provide sufficient security for a given location. Please review [FortiGate Best Practices](https://docs.fortinet.com/document/fortigate/7.6.99/best-practices/587898/getting-started) and [FortiGate Admin Guide](https://docs.fortinet.com/document/fortigate/7.6.99/administration-guide/954635/getting-started) to compliment this deployment.

Underlay routing is assumed to be present. No consideration is given for FortiGate internet reachability. It is assumed that the branches and hub have full internet connectivity and public IP addresses. 