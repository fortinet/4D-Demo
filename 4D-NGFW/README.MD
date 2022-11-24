# NGFW demonstration configurations (4-D)

4-D Demo configurations are a collection of configurations which complement the preceeding 3 Ds: Define, Design, and Deploy. The deployment configuration detailed in this guide describes/provides one way of configuring a FortiGate to provide security to small and medium businesses. The example is designed for a hypothetical company with typical security needs. The naming of the VLANs are IP addressing are generic, and can be adapted for businesses with different number of employees and departments. 

The configuration recommended adheres to Fortinet security best practices and provides a base upon which the administrator can make customizations to better match their needs, as well as expand upon when implementing additional technologies such as SD-WAN, FortiSASE, and ZTNA. 


# Overview

This document will cover the step-by-step procedures required to deploy a Next Generation Firewall for a SMB environment using a 70F FortiGate. This guide outlines procedures based on recommended Fortinet Best Practices. In this case, the customer is defined as follows:

•	A Small-Medium sized Business ranging from 20-100 employees with several departments

•	Single location with a single WAN connection


The following are the requirements:

•	Deploy one FortiGate at the network edge

•	Segment the network for different departments, though only Sales, Engineering, and IT are specified for brevity.

•	Provide Next Generation Firewall Security by leveraging the UTM features of the FortiGate 

•	Implement security policies for the company by applying appropriate security profiles to firewall policies 

•	Configure wireless networks to provide access to department-specific resources

	o	Secure wireless networks using WPA2-Enterprise that is linked to users on a remote server

•	Send FortiGate logs offsite to FortiGate Cloud

•	Leverage FortiSandbox to inspect suspicious files that do not match any 
existing virus signatures 

•	Harden the device to restrict management access from external sources.

# How to
The following configuration was designed to be pasted directly into your 70F FortiGate. Some modifications are required to reflect your environment, such as server IP addresses and serial numbers. Ensure you review the topology's and make the necessary changes to the configuration to match your deployment.

Additionally, some configuration must be performed manually and cannot be provided. These configurations are:

1. You must complete the ACME process to generate a certificate for Administrative access. Alternatively you may provide a certificate of your choosing.

2. The RADIUS server configuration will need to be updated 
```
config user radius
(...)
```

3. A VoIP security profile must be created to reflect your VoIP operation and then applied to your security policies.

4. Adjust various services to reflect your business environment.

5. FortiToken must be added to the Admin accounts (Local and RADIUS).

6. Admin account passwords should be updated from those provided in the configuration.

7. The wireless access point serial number must be provided 
```
config wireless-controller wtp
    edit "AP_SN"
```

8. The wireless platform must match the model of your APs 
```
config wireless-controller wtp-profile
    edit "Corp_Wireless"
        config platform
            set type U321EV
```

9. FortiCloud Sandbox must be activated from the CLI or GUI.

Note that consideration should be given for the connecting interface and port when pasting the configuration. Some of the configuration may result in loss of access.



# Disclaimers

While the configuration provides a good base configuration for NGFW security, it must be adapted and built upon to best fit your company's needs and security posture. 

There is no consideration for the WAN interface. You must configure both the interface as well as a default route if required.

Configuration is provided for a 70F FortiGate. If you are using another model, you may have to adjust some settings such as interface names (port1 vs internal1).