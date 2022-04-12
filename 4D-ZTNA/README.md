# ZTNA demonstration configurations (4-D)

4-D Demo configurations are a collection of configurations which complement the preceding 3 Ds: Define, Design, and Deploy. The sample configurations can be used as a template to build your own ZTNA solution, or used as reference during your deployment.

It is recommended to first review the [ZTNA Architecture Guide](https://docs.fortinet.com/document/fortigate/7.0.0/ztna-architecture/800134/introduction) and [ZTNA Deployment Guide](https://docs.fortinet.com/document/fortigate/7.0.0/ztna-deployment/813800/introduction) found in the [ZTNA 4-D Resource hub](https://docs.fortinet.com/4d-resources/ZTNA) before proceeding further.

Additionally, head to the [ZTNA Solution Hub](https://docs.fortinet.com/ztna) for more extensive links to documentation related to ZTNA.

# Overview

The primary goal of **Zero Trust Network Access (ZTNA)** is to allow an organization to provide remote access to protected resources while granting user access based on the authenticity of the client, their security posture and user authentication. This is accomplished by synchronizing information about the endpoints between the FortiClient, FortiClient EMS and the FortiGate.

The following topology illustrates an environment where multiple Fortinet products are deployed.

Required:
- FortiClient 7.0 and above
- FortiClient EMS 7.0 and above
- FortiGate 7.0 and above

Optional:
- FortiAnalyzer
- FortiAuthenticator

While FortiAnalyzer and FortiAuthenticator are optional, these devices are recommended in larger deployments where centralized logging, monitoring, reporting and authentication is desired.

## Topology
![ZTNA Demo Topology](https://fortinetweb.s3.amazonaws.com/docs.fortinet.com/v2/resources/8ddfc8d2-9b21-11ec-9fd1-fa163e15d75b/images/49d98988a19e8978bb0553e80a3c331d_deployment_topo.png "ZTNA Demo Topology") 

# How to
The sample configuration is based in large part on the example provided in the [ZTNA Deployment Guide](https://docs.fortinet.com/document/fortigate/7.0.0/ztna-deployment/813800/introduction). You can follow the [deployment procedures](https://docs.fortinet.com/document/fortigate/7.0.0/ztna-deployment/260520/deployment-procedures) step by step to configure ZTNA in your environment, or you can use the configuration snippets in the sample configuration to quickly launch your environment.

Download the sample configuration [ZTNA-demo-config.txt](./ZTNA-demo-config.txt). Examine the file and adapt the settings to your environment.

- This sample file is split into the multiple sections. Each section contains command line settings and debugs.
- The configuration snippets correspond to IP addressing in the topology diagram above. Modify names, addresses, ports and other references to fit your environment
- The configuration snippets can be directly copied and pasted into the FortiGate CLI
- Use the command line debug commands to verify and confirm your deployment
- Configurations for FortiClient EMS must be done in the GUI 

The following summarizes the goal of each section.

### 1. Configuring FortiClient EMS Fabric connector
- Establish a connection between the FortiGate and FortiClient EMS
- Verify the connection

### 2. Verify Tags are synchronized
- On the FortiClient EMS, configure ZTNA Tags and Rules per the instructions on [Configuring FortiClient EMS tags and rules](https://docs.fortinet.com/document/fortigate/7.0.0/ztna-deployment/16635/configuring-forticlient-ems-tags-and-rules)
- Verify the tags are synchronized to the FortiGate

### 3. Configure a ZTNA Server to map to web servers using HTTPS access proxy
- Define the VIP and HTTPS access proxy server settings
- Map services to Webserver1 and Webserver2

### 4. Configure a ZTNA TCP forwarding access proxy for RDP and SSH
- Define another VIP and TCP forwarding access proxy server settings
- Map services to the EMS server and the FortiAnalyzer

### 5. Configure the Authentication Scheme and Policy for user authentication
- Define the LDAP server connection to the Windows server. In this example, it is also configured as the EMS server
- Define the user group and directory that is allowed access
- Define the authentication method and the devices that the authentication scheme should apply to

### 6. Configure ZTNA Rules to control access
- Define the actual ZTNA rules to allow and deny access based on user authentication and security postures

### 7. Configure ZTNA Connection Rules on FortiClient EMS for any TCP Forwarding Access Proxy traffic
- Define the ZTNA connection rules that will be pushed to each FortiClient endpoint. These rules are used for accessing services mapped by the TCP Forwarding access proxy

### 8. Connecting to ZTNA access proxy
- Once a client endpoint registers and connects to the ZTNA access proxy, verify connectivity using various debugs and logs

# Disclaimers

These configurations are for basic ZTNA deployment on the primary components of the solution, based on *FortiOS 7.0.5* and *FortiClient EMS 7.0.2*. While configurations will be compatible with newer builds, extra caution should be taken when installing these settings on earlier builds.

Further design considerations should be taken by reviewing the [ZTNA Architecture Guide](https://docs.fortinet.com/document/fortigate/7.0.0/ztna-architecture/800134/introduction) and [ZTNA Deployment Guide](https://docs.fortinet.com/document/fortigate/7.0.0/ztna-deployment/813800/introduction). Design decisions may include:

- How the FortiClient EMS is exposed for registration from local and remote FortiClient endpoints
- How the FortiClient software should be installed on the endpoint devices
- Which services to expose via HTTPS access proxy and which services to expose via TCP forwarding access proxy
- What authentication method should be used
- Which users/user groups are granted access to which resources
- IP addressing for public and private resources
- Migration plan from using VPN based teleworking to ZTNA based remote access

Please consult further documentation available from the [ZTNA solution hub](https://docs.fortinet.com/ztna) for reference.
