# LAN Edge demonstration configurations (4-D)

4-D Demo configurations are a collection of configurations which complement the preceding 3 Ds: Define, Design, and Deploy. The sample configurations can be used as a template to build your own LAN Edge solution, or used as reference during your deployment.

It is recommended to first review the [LAN Edge Deployment Guide](https://docs.fortinet.com/document/fortiswitch/7.0.0/lan-edge-deployment-guide/397092/introduction) found in the [Switching 4-D Resource hub](https://docs.fortinet.com/4d-resources/Switching) before proceeding further.

Additionally, head to the [Secure Access Solution Hub](https://docs.fortinet.com/secure-access) for more extensive links to documentation related to Switching and Wireless.

# Overview

The primary goal of the **LAN Edge** is to provide Security-Driven Networking by extending the Fortinet Security Fabric throughout the LAN, converging security and network access into an integrated platform. This is accomplished by integrating the FortiAP and FortiSwitch into FortiGate's management via the Wireless and Switch controller.

The following topology illustrates an environment where multiple Fortinet products are deployed.

Required:
- FortiGate 7.0 and above
- FortiSwitch ([*Compatible version*](https://docs.fortinet.com/document/fortiswitch/latest/fortilink-compatibility))
- FortiAP ([*Compatible version*](https://docs.fortinet.com/document/fortiap/latest/fortiap-and-fortios-compatibility-matrix/495193/))

## Topology
![LAN Edge Demo Topology](https://fortinetweb.s3.amazonaws.com/docs.fortinet.com/v2/resources/b8d79243-885d-11ec-9fd1-fa163e15d75b/images/c52adce07500f12ad7514dd269982a79_LANedgeExample.png "LAN Edge Demo Topology") 

# How to
The sample configuration is based in large part on the example provided in the [LAN Edge Deployment Guide](https://docs.fortinet.com/document/fortiswitch/7.0.0/lan-edge-deployment-guide/397092/introduction). You can follow the [deployment procedures](https://docs.fortinet.com/document/fortiswitch/7.0.0/lan-edge-deployment-guide/720231/deployment-procedures) step by step to configure a LAN Edge in your environment, or you can use the configuration snippets in the sample configuration to quickly launch your environment.

Download the sample configuration [LAN-Edge-demo-config.txt](./LAN-Edge-demo-config.txt). Examine the file and adapt the settings to your environment.

- This sample file is split into the multiple sections. Each section contains command line settings and debugs.
- The configuration snippets correspond to IP addressing in the topology diagram above. Modify names, addresses, ports and other references to fit your environment
- The configuration snippets can be directly copied and pasted into the FortiGate CLI
- Use the command line debug commands to verify and confirm your deployment

The following summarizes the goal of each section.

### 1. Configure FortiLink and authorize the FortiSwitch unit
- (*Optional*) If your Desktop model FortiGate does not have dedicated FortiLink ports, remove two of the LAN ports from the LAN interface to be used in the FortiLink interface
- Configure two interfaces to be the dedicated FortiLink aggregate interface
- Physically connect the FortiSwitch to the FortiGate. Verify the FortiSwitch is automatically authorized

### 2. Create VLANs and firewall policies for wired devices
- Create two internal VLANs,VLAN100 and VLAN200, both with Internet access and routing between them allowed
- Internal VLANs can be used for different departments, different types of devices or other use cases defined by the customer
- More VLANs can also be added in this step

### 3. Set up NAC and create NAC policies
- When FortiLink is configured, NAC VLANs are created according to the switch-controller.initial-config.template settings
- These VLANs are automatically created: *onboarding, nac_segment, video, voice, rspan and quarantine*
- By default, onboarding is configured as the onboarding VLAN
- NAC policies can be configured to automatically segment devices into separate VLANs based on device type, family, OS, MAC address mask, etc... 
- In this example, devices in the onboarding VLAN do not get any network access
- Access is allowed once NAC policies place devices into either *VLAN100* or *VLAN200*
- One use case may place all user devices on *VLAN100*, and other IoT devices on *VLAN200*. Another use case may place user and IoT devices in *VLAN100*, and servers on *VLAN200*
- Our example demonstrates a NAC policy which matches a device by MAC address and assigns it to *VLAN100*

### 4. Assign FortiSwitch ports to Static VLANs and NAC 
- FortiSwitch ports can function in static mode, port policy mode or NAC mode. 
- Our topology puts port2 in NAC mode, port3 and port4 in static mode with VLAN100 and port5 and port6 in static mode with VLAN200

### 5. Deploy WiFi
- Prepare an AP VLAN (*VLAN-AP*) to create security isolation between the AP management (control channel) and user traffic (data channel)
- Assign the VLAN-AP to a FortiSwitch port
- Connect the FortiAP to the FortiSwitch
- Create an SSID in tunnel mode
- Configure a firewall policy to allow access 

# Disclaimers

These configurations are for basic LAN Edge deployment on the primary components of the solution, based on *FortiOS 7.0.3*, *FortiSwitch 6.4.4* and *FortiAP 6.4.4*. While configurations will be compatible with newer builds, extra caution should be taken when installing these settings on earlier builds. Review the [FortiLink compatibility matrix](https://docs.fortinet.com/document/fortiswitch/latest/fortilink-compatibility "FortiLink Compatibility") and [FortiAP compatibility matrix](https://docs.fortinet.com/document/fortiap/latest/fortiap-and-fortios-compatibility-matrix/495193/ "FortiAP compatibility") for more information. 

Further design considerations should be taken by reviewing the [LAN Edge Deployment Guide](https://docs.fortinet.com/document/fortiswitch/7.0.0/lan-edge-deployment-guide/823484/design-overview "Design overview"). Design decisions may include:

- FortiGate/FortiSwitch/FortiAP Sizing
  - How many endpoint devices require wired and wireless access?
  - What model and how many devices to deploy?
- LAN segmentation
  - How many VLANs are needed?
  - How to group devices into VLANs? By department? By device type? 
  - When to use static mode vs NAC mode
  - Are inter-VLAN access allowed?
  - Access levels for onboarding VLAN vs traffic VLANs
  - Is port authentication needed?
- WiFi connectivity
  - Tunnel mode vs Bridge mode
  - Wireless mode and channel planning
  - Authentication method - WPA2-Personal, WPA2-Enteprise, WPA3-Personal, WPA3-Enterprise
  - Guest access

Please consult further documentation available from the [Secure Access Solution Hub](https://docs.fortinet.com/secure-access) for reference.
