# NGFW deployment using Terraform

The following terraform files will allow you to deploy a Fortinet recommended NGFW configuration following the outline and default settings described in the [NGFW Deployment guide](https://docs.fortinet.com/document/fortigate/7.0.0/ngfw-deployment/139223/deployment-overview)

![Logical Topology](./Logical-Topology.png?raw=true "Topology") 

## Quick Links
- [Pre-requisites](#pre-requisites)
  - [Connectivity](#connectivity)
  - [Administration](#administration)
  - [Authentication](#authentication)
  - [Other factory settings](#other-factory-settings)
- [Deployment Steps](#deployment-steps)
  - [Customizing your configuration](#customizing-your-configuration)
  - [Deploying on Terraform](#deploying-on-terraform)
  - [Post Deployment](#post-deployment)
- [FAQ](#faq)
- [Disclaimer](#disclaimer)
  
## Pre-requisites
The FortiGate should be in factory default before starting the deployment. To reset the FortiGate to factory, login to the FortiGate from the CLI. Then execute the following command:

    # execute factoryreset 
	
See [Restore factory defaults](https://docs.fortinet.com/document/fortigate/latest/administration-guide/702257/configuration-backups#RestoreFactoryDefaults) for more information.

### Connectivity:
Before you begin applying the Terraform scripts, ensure proper connectivity in your test environment. 

![Physical Topology](./Physical-Topology.png?raw=true "Topology")

1. The FortiGate is connected to the Internet on its **WAN** interface. A proper default route must be configured to allow it to go to the Internet. These settings will not be modified by Terraform.
2. The FortiGate is connected to a managed switch on its **LAN** interface. The switch port connected to the FortiGate is a 802.1Q trunk. The switch has the VLANs defined in the logical topology.
3. Administrator is recommended to connect to the FortiGate on the **MGMT** interface per security best practices. However, if a MGMT interface is not available, then connect through the WAN interface.
4. A FortiAP is used for wireless connectivity. It is assumed to be connected to the managed switch in the native VLAN that is connected to the FortiGate LAN interface.

### Administration:
Terraform uses REST API to connect to the FortiGate to make changes. Therefore, some manual configuration should be performed in order for Terraform to access the FortiGate on HTTPS.

1. The HTTPS port used to access the FortiGate should be changed to a port which matches the `admin_https_port` setting in the `terraform.tfvars` config file (Default = 9443). To change, go to the FortiGate GUI > System > Settings. Change the HTTPS port to your desired port.

2. Create a REST API administrator using the [REST API administrator instructions](https://docs.fortinet.com/document/fortigate/7.2.99/administration-guide/399023/rest-api-administrator).
	- The Administrator profile should provide read/write access to all configs
	- PKI Group should be disabled
	- Trusted Hosts is set to the subnet or host IP of the computer running Terraform. 

### Authentication:
Our best practices encourage the use of a remote RADIUS server for administrator and wireless authentication, and 2FA for the administrator. Therefore, our configurations expect the following:

1. A RADIUS server, such as NPS over Windows AD or FortiAuthenticator, is configured and allows the FortiGate as a client. The following groups should be present:
	- FirewallAdmin - Contains firewall administrators
	- Engineering - Contains users from the Engineering department
	- IT - Contains users from the IT department
	- Staff - Contains regular Staff that belong to other departments
 
2. An available FortiToken for the FWAdmin user.

### Other factory settings:
1. On some models, the default LAN interface has a DHCP server configured. This setting must be removed before deployment, as it interferes with the Terraform configurations. See [The default DHCP settings...](#the-default-dhcp-settings-on-my-fortigate-lan-interface-did-not-get-overriden-by-my-configured-lan-dhcp-settings)
2. On some models, the default configurations has a LAN->WAN firewall policy pre-configured. This policy must be removed before deployment.

The firewall is expected to be in factory default other than the settings mentioned in the sections above.

## Deployment Steps
Once the pre-requisites are met, follow these steps to customize the settings for your network before deployment.

### Customizing your configuration
These Terraform scripts use custom settings stored in variables within the `terraform.tfvars` file. The values of these variables are used in various terraform config files. The following section goes through variables that can be defined and where they are applied.

#### 1. Provider and host settings (`ngfw_main.tf`)
Terraform needs the REST API provider (FortiOS) and connection parameters of your FortiGate. These values are defined in the `ngfw_main.tf` file.

To customize, edit the following variables in the `terraform.tfvars` file:

| Syntax | Description |
| ----------- | ----------- |
| host | FortiGate IP and optional port (ip:port). Port should match the `admin_https_port` value |
| token | FortiGate API user token |

  - **Note 1:** *This example uses an insecure connection. Please see the [following link](https://registry.terraform.io/providers/fortinetdev/fortios/latest/docs) for more information on setting up your FortiGate and Terraform.* 
  - **Note 2:** *Because the REST API administrator's token is defined in plain text in the config, it is important that the terraform.tfvars file is secured from unauthorized access. While implementation is beyond the scope of this document, consider using environment variables to hold sensitive data. Please see [Reading and using environment variables in Terraform runs](https://support.hashicorp.com/hc/en-us/articles/4547786359571-Reading-and-using-environment-variables-in-Terraform-runs) for more information.*


#### 2. Global settings (`ngfw_global.tf`)
Global FortiGate settings such as lockup times, admin ports and hostname are defined in the `ngfw_global.tf` file.

To customize, edit the following variables in the `terraform.tfvars` file:

| Syntax | Description |
| ----------- | ----------- |
| hostname | Name of the FortiGate |
| admin_https_port | Port used for admin HTTPS access. Default = 9443 |
| admin_ssh_port | Port used for admin SSH access. Default = 9922 |

#### 3. RADIUS server settings (`ngfw_radius.tf`)
A RADIUS server is used as a remote authentication server for the Admin user and Wireless WPA2 users.

To customize, edit the following variables in the `terraform.tfvars` file:

| Syntax | Description |
| ----------- | ----------- |
| radserver | IP address of the RADIUS server |
| radpass | Password of the RADIUS server |
| radname | The name of the RADIUS server, as it appears on the FortiGate |

#### 4. Administrator settings (`ngfw_admin.tf`)
A firewall administrator is created that will replace your default "admin" user. 

This new adminstrator has the following attributes:

- read/write access
- remote authentication using RADIUS, in a group called FirewallAdmin
- 2FA using FortiToken
- Backup password when RADIUS server is unreachable
- Trusted host to restrict access

To customize, edit the following variables in the `terraform.tfvars` file:

| Syntax | Description |
| ----------- | ----------- |
| trusthost | IP address/subnet of host that the admin will be connecting from |
| fortitoken | Unused FortiToken S/N from FortiGate |
| adminemail | Administrator's email to send token activation to |
| adminpassword | Backup password when RADIUS server is unreachable |

  - **Note:** FortiToken S/N must be obtained from the FortiGate by going to *User & Authentication > FortiTokens*. Once the token activation email is sent, the administrator must activate on their FortiToken Mobile app before the token takes effect.
 
#### 5. Interface settings (`ngfw_interfaces.tf`)
Because each model of FortiGate is different, first you must define your interface mapping:

| Syntax | Description |
| ----------- | ----------- |
| WAN_INT | The physical interface connected to the Internet. Default = port1 |
| LAN_INT | The physical interface connected to your managed switch. Default = port2 |
| MGMT_INT | The physical interface for your management network. Default = port3 |

Next, define your Interface addresses. The WAN inteface is untouched in this configuration.

| Syntax | Description |
| ----------- | ----------- |
| LAN_addr | The address and netmask of your LAN interface in the form x.x.x.x y.y.y.y |
| MGMT_addr | The address and netmask of your MGMT interface in the form x.x.x.x y.y.y.y |
| vlan_netmask | The subnet mask used in your DHCP settings |

The LAN interface by default has DHCP enabled. Customize the DHCP settings as needed.

| Syntax | Description |
| ----------- | ----------- |
| vlan1_default_gw | Default gateway assigned to DHCP clients. The address should be same as LAN_addr without the netmask|
| vlan1_start | The start of the DHCP address range to assign to DHCP clients |
| vlan1_end | The end of the DHCP address range to assign to DHCP clients |
| vlan1_int | The physical LAN interface (LAN_INT) | 
| vlan1_subnet  | The physical LAN interface's subnet | 

#### 6. VLAN configurations (`ngfw_interfaces.tf`)
This deployment configures many different VLANs per the topology diagram. For each VLAN, its VLAN settings can be customized.

VLAN20, which allows traffic from wired and wireless users from the IT dept, is depicted here:

| Syntax | Description |
| ----------- | ----------- |
| VLAN20_IP | IP address and netmask of the VLAN20 sub-interface. Default = "192.168.20.254 255.255.255.0" |
| VLAN20_default_gw | Default gateway assigned to DHCP clients. The address should be same as VLAN20_IP without the netmask |
| VLAN20_start | The start of the DHCP address range to assign to DHCP clients |
| VLAN20_end | The end of the DHCP address range to assign to DHCP clients |
| VLAN20_int | The VLAN interface associated with the DHCP setting | 
| VLAN20_name | The VLAN interface name. Default = "VLAN20" |
| VLAN20_subnet | The VLAN interface subnet for creating the associated subnet address object. Default = "192.168.20.0 255.255.255.0" |
| VLAN20_usergroup | The allowed user group for the associated wireless SSID |
| VLAN20_name_net | The name of the subnet for creating the associated subnet address object. | 

Configure additional VLANs as above. Edit the values corresponding to each VLAN ID.

#### 7. Address and service objects (`ngfw_zaddresses.tf` & `ngfw_services.tf`)
For some VLANs, define variables for address and service objects:

| Syntax | Description |
| ----------- | ----------- |
| VLAN21_SRV_IP | IP address used in service object |
| VLAN21_SRV_IP_Subnet | IP subnet used in address object |
| VLAN21_SRV_port1 | port used in service object 1 |
| VLAN21_SRV_port2 | port used in service object 2 |
| VLAN21_SRV_name1 | Name of address and service object 1 | 
| VLAN21_SRV_name2 | Name of address and service object 2 |
| VLAN21_SRV_GRP_NAME | Name of address and service object group |

#### 8. Wireless configurations (`ngfw_wireless.tf`)
The wireless configs create SSIDs per department in bridge mode. Users require WPA2-Enteprise authentication, which authenticates users against the remote RADIUS server.

Each SSID allows the user group defined within the VLAN configurations. 

To customize, edit the following variables in the `terraform.tfvars` file:

| Syntax | Description |
| ----------- | ----------- |
| wtp_profile | Name of the FortiAP profile to be used for APs in your network |
| ap_type | Type of FortiAP |
| ap_SN | Serial Number of the FortiAP to be authorized |
| wtp_profile-legacy | If FortiAP model is a legacy model not supported by ap_type, specify the default wtp-profile for that model |
| SSID1 | Name of SSID1, associated with VLAN20 | 
| SSID2 | Name of SSID1, associated with VLAN30 |
| SSID3 | Name of SSID1, associated with VLAN70 |

#### 9. FortiGate Cloud logging (`ngfw_system.tf`)
To enable FortiGate Cloud logging, you must provide your FortiCare account info. 

| Syntax | Description |
| ----------- | ----------- |
| service_account | The email address used to register to FortiCare and FortiCloud |
| service_region | The region in which to access FortiCloud/FortiGuard services. Default = automatic |

Before applying this on Terraform, the FortiCare/FortiCloud account should be activated manually. See [FortiCare and FortiGate Cloud Login](https://docs.fortinet.com/document/fortigate/7.2.99/administration-guide/424878/forticare-and-fortigate-cloud-login) for options to activate your account. 


### Deploying on Terraform
Once you have reviewed your Terraform variables and customized it to your network, you are ready to deploy. At this point, you may want to first login to your FortiGate and backup the current configuration. 

In the directory in which your Terraform files reside, initialize Terraform:

    terraform init
	
This downloads the FortiOS provider plugin and initializes the environment.

Next, run the following command to plan the deployment:

    terraform plan

The plan describes the settings that will be added, changed and deleted. It is summarized into (numbers may vary):

    Plan: 74 to add, 8 to change, 0 to destroy.

When you have reviewed the plan, you can now apply the configs:

    terraform apply

When prompted, type 'yes' to continue. 

Once `terraform apply` has completed, you will either have successfully completed the configs, or some errors may have occurred. 

    Apply complete! Resources: 72 added, 6 changed, 0 destroyed.

If errors occured, it may be caused by the order in which the configs were executed. Re-run `terraform apply`. Many of the errors may be fixed.

If you run into the following errors:

#### 1. Cannot send request. Lost connection to firewall
```
│   Error: Error creating SystemAdmin resource: cannot send request lost connection to firewall with error: 
│   Post "https://172.16.151.155:40418/api/v2/cmdb/system/admin?access_token=***************": 
│   dial tcp 172.16.151.155:40418: 
│   connectex: A connection attempt failed because the connected party did not properly respond after a period of time, or established connection failed because connected host has failed to respond.
```

This can happen if the port you are connecting to is different from the port in the `terraform.tfvars` config. Ensure the port in the `host` setting is the same as the port in the `admin_https_port` setting.

#### 2. FortiGate Cloud Logging error
```
│   Error: Error updating LogFortiguardSetting resource: Internal Server Error - Internal error when processing the request (500)
│   Cli response:
│   Haven't set FortiCloud account id
```

 See [FortiCare and FortiGate Cloud Login](https://docs.fortinet.com/document/fortigate/7.2.99/administration-guide/424878/forticare-and-fortigate-cloud-login) for options to activate your account. Then try `terraform apply` again.

#### 3. Wireless managed AP error
```
│   Error: Error creating WirelessControllerWtp resource: Internal Server Error - Internal error when processing the request (500)
│
│   with fortios_wirelesscontroller_wtp.AP,
│   on ngfw_wireless.tf line 101, in resource "fortios_wirelesscontroller_wtp" "AP":
```

Follow these steps to resolve:

1. Ensure the FortiAP is connected to the FortiGate on the LAN interface's native VLAN (1). 
2. From WiFi Controller > Managed FortiAPs, the FortiAP should be ready to be authorized. Authorize the AP.
3. Import the AP configurations.
```
    terraform import fortios_wirelesscontroller_wtp.AP <AP serial number>
```
4. Once imported, The Terraform local database can now manage this setting. Perform `terraform apply` again

See [I ran into errors ...](#i-ran-into-errors-that-require-importing-configs-how-do-i-do-that) for more information.

#### 4. FWAdmin error
```
│ Error: Error updating SystemAdmin resource: Forbidden - Request is missing CSRF token or administrator is missing access profile permissions (403)
│
│   with fortios_system_admin.FWAdmin,
│   on ngfw_admin.tf line 17, in resource "fortios_system_admin" "FWAdmin":
│   17: resource "fortios_system_admin" "FWAdmin" {
```

This error may occur if you applied the configs once, and then changed the configs manually on the FortiGate. This makes the config out of sync but Terraform cannot edit the admin config.

To get rid of the error, manually remove the FWAdmin config on your FortiGate, then run `terraform apply` again.



### Post deployment

After deployment has completed, one additional step is needed in order to initialize the FWAdmin user. 

From System > Administrators, edit the FWAdmin user. Under Two-factor authentication, click *Send Activation Code Email*. Upon receiving the activation code, the administrator should add the token on his FortiToken app.

Once the post deployment step is complete, verify the deployment is successful by: 

- [ ] Logging into the FortiGate as FWAdmin. Verify 2FA and remote authentication works.
- [ ] Logging into the FortiGate as FWAdmin using the backup password while RADIUS server is unreachable. 
- [ ] Disabling default 'admin' user.
- [ ] Connecting to the managed switch in each of the VLANs. Verify network connectivity.
- [ ] Connecting to each of the wireless SSIDs. Verify authentication is successful.

Finally, backup your FortiGate configuration. 


## FAQ 

### I want to leave out some settings because I don't want to configure them. What should I do?
You can comment out individual settings, or if you want to omit an entire configuration, change the .tf file extension to .tf.tmp

### How can I debug whether settings are being saved to the FortiGate?
On the FortiGate CLI, you can run 

    # diag debug enable
	# diag debug application cli 7
	
### My FWAdmin account's 2FA doesn't work.
Verify that your FortiToken has been activated and shows up as Assigned under *User & Authentication > FortiTokens*. For additional help, see [Troubleshooting and diagnosis](https://docs.fortinet.com/document/fortigate/7.2.99/administration-guide/180506/troubleshooting-and-diagnosis).

### My WiFi authentication doesn't work.
For each SSID, the FortiGate expects a specific group to be returned as RADIUS VSA. These are:

 - Engineering
 - IT
 - Staff
 
When using NPS on Windows, see [Restricting RADIUS user groups to match selective users on the RADIUS server](https://docs.fortinet.com/document/fortigate/7.2.99/administration-guide/710485/restricting-radius-user-groups-to-match-selective-users-on-the-radius-server) for more information.

This also applies for FWAdmin user, which expects RADIUS to return the user in the following group:

 - FirewallAdmin

###  The default DHCP settings on my FortiGate LAN interface did not get overriden by my configured LAN DHCP settings.
Terraform cannot easily remove or modify existing objects that are pre-configured on the FortiGate. Therefore, on models that have a default DHCP server configured on the LAN interface, perform the following before deploying the Terraform scripts.
- From Network > Interfaces, edit the LAN interface (this is often called *internal* on Desktop models).
- Disable the DHCP Server setting.
- Click OK to save the change.

If this step is not taken, Terraform will deploy a new DHCP server on the LAN interface which acts as the secondary DHCP and only assigns IP addresses when the primary runs out of available addresses. 

### I am uncomfortable with storing passwords and tokens in plain-text.
Note that there are several passwords used in the variables file. These are provided in plain text and these scripts are intended to be used in a secure environment for testing purposes. For use in production, review your company policy regarding password storage and ensure terraform adheres to these requirements. For further reading on password protection and use, please see the blog entry [A comprehensive guide to managing secrets in your Terraform code](https://blog.gruntwork.io/a-comprehensive-guide-to-managing-secrets-in-your-terraform-code-1d586955ace1)

### I ran into errors that require importing configs. How do I do that?
In some rare occurances, Terraform will generate a (500) error as it attempts to create or modify resources which already exist. A Internal (500) error may appear as follows:

    │   Error: Error creating xxxxxx resource: Internal Server Error - Internal error when processing the request (500)

In order to configure these settings, you must import the resource into the Terraform local state table in order to inform Terraform that the resource can be managed locally.

For example:

a. Sample Terraform resource definition that needs to be imported:

    `resource "fortios_firewall_address" "tf_only_name" {}`

b. To import an address object on the FortiGate called "Existing_address_object":

    `terraform import fortios_firewall_address.tf_only_name Existing_address_object`

The above command updates the `tf_only_name` resource with the settings on the FortiGate for `Existing_address_object`.

Below are example pre-existing configurations that may be imported. 

    terraform import fortios_system_interface.internal internal
    terraform import fortios_system_interface.fortilink fortilink
    terraform import fortios_wirelesscontroller_wtp.AP <AP serial number>


### Can I change the VLAN ID?
VLAN IDs are hard coded. E.g. VLAN20 will always use vlan 20. The name may be changed in the variables but the VLAN can not.


### Additional known issues
At the time of writing, there is an issue with configuring the schedule on a wireless VAP. This causes the local Terraform state table to be always out of sync with the FortiGate config in the following way:

    ~ schedule = "\"always\"" -> "always"

Therefore, Terraform will report there are changes even though no config has been changed. This has been reported and will be fixed in the next release.

### What models and versions have this been tested on?
| Model | Version |
| ----------- | ----------- |
| FGT-70D | FOS v7.0.11 B0489|
| FGT-VM64 | FOS v7.2.4 B1396|
| FAP-U321EV | FAP v5.4 B0065 |
| FAP-431F | FAP v7.0 B0034 | 

## Disclaimer
The Terraform scripts are only meant to be used in a test environment for demonstration purposes. 

If deploying to production is necessary, ensure that you secure your Terraform environment from unauthorized access. Safeguard your passwords and keys using environment variables to hold sensitive data. Please see [Reading and using environment variables in Terraform runs](https://support.hashicorp.com/hc/en-us/articles/4547786359571-Reading-and-using-environment-variables-in-Terraform-runs) for more information.

Alternatively, go to [I am uncomfortable with storing passwords and tokens in plain-text](#i-am-uncomfortable-with-storing-passwords-and-tokens-in-plain-text) for other recommendations.