# SD-WAN High Availability

The following CLI settings are used to convert a SD-WAN node (branch of hub) to a FGCP High Availability cluster. 

These settings are one example of implementing HA on FortiGates. You may require the use of additonal settings, or changes to the provided settings to meet your business needs. For more information, please see the FortiGate admin guide [HA section](https://docs.fortinet.com/document/fortigate/7.6.4/administration-guide/62403/fgcp), and the [SD-WAN HA section](https://docs.fortinet.com/document/fortigate/7.6.4/administration-guide/587596/ha).

Further tuning to BGP and HA settings must be considered on a case-by-case implementation, as the settings must match the environment. For more details, please see the community article on [Configuring FortiGate HA and BGP Graceful Restart](https://community.fortinet.com/t5/FortiGate/Technical-Tip-Configuring-FortiGate-HA-and-BGP-graceful-restart/ta-p/196150).

# Topology

This topology indicates which ports are used to establish the HA cluster with secondary members.
After the cabling is in place, run the CLI commands on the Primary device to initiate the HA cluster negotiation. 

Repeat the same commands on all secondary cluster members, changing the priority setting to values below that of the primary. Use decending values to control the order of which secondary members will become primary in the event a failover is required.

### Standalone FortiGate
This diagram provides the initial configuration for the SD-WAN node.
![Standalone Topology](./Standalone_topology.png?raw=true "Standalone") 

### FGCP HA Cluster
This topology indicates the topology used after HA has been implemented.
![High Availability Topology](./HA_topology.png?raw=true "HA Topology") 