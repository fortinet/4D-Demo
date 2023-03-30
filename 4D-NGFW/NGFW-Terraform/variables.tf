variable "host" {
    type        = string
    description = "FortiGate IP and optional port (ip:port)"
}
variable "token" {
    type        = string
    description = "FortiGate API user token"
}


variable "hostname" {
    type        = string
    description = "Name of the FortiGate"
}
variable "admin_https_port" {
    type        = string
    description = "Port used for admin HTTPS access"
}
variable "admin_ssh_port" {
    type        = string
    description = "Port used for admin SSH access"
}


variable "radserver" {
  type = string
}
variable "radpass" {
    type        = string
}
variable "radname" {
    type = string
}


variable "trusthost" {
    type = string
}
variable "fortitoken" {
    type = string
}
variable "adminemail" {
    type = string
}
variable "adminpassword" {
    type = string
}


variable "WAN_INT" {
  type = string
  description = "FortiGate WAN interface"
}
variable "LAN_INT" {
  type = string
  description = "FortiGate LAN interface"
}
variable "MGMT_INT" {
  type = string
  description = "FortiGate MGMT interface"
}


variable "LAN_addr" {
  type = string
  description = "LAN address"
}
variable "MGMT_addr" {
  type = string
  description = "MGMT address"
}
variable "vlan_netmask" {
    type = string
}


variable "vlan1_default_gw" {
  type = string
}
variable "vlan1_start" {
  type = string
}
variable "vlan1_end" {
  type = string
}
variable "vlan1_int" {
  type = string
}
variable "vlan1_subnet" {
  type = string
}

variable "VLAN20_IP" {
  type = string
}
variable "VLAN20_default_gw" {
  type = string
}
variable "VLAN20_start" {
  type = string
}
variable "VLAN20_end" {
  type = string
}
variable "VLAN20_int" {
  type = string
}
variable "VLAN20_name" {
    type = string
}
variable "VLAN20_subnet" {
    type = string
}
variable "VLAN20_usergroup" {
  type = string
}
variable "VLAN20_name_net" {
  type = string
}


variable "VLAN21_IP" {
  type = string
}
variable "VLAN21_default_gw" {
  type = string
}
variable "VLAN21_start" {
  type = string
}
variable "VLAN21_end" {
  type = string
}
variable "VLAN21_int" {
  type = string
}
variable "VLAN21_name" {
    type = string
}
variable "VLAN21_subnet" {
    type = string
}
variable "VLAN21_name_net" {
  type = string
}
variable "VLAN21_SRV_IP" {
  type = string
}
variable "VLAN21_SRV_IP_Subnet" {
  type = string
}
variable "VLAN21_SRV_port1" {
  type = string
}
variable "VLAN21_SRV_port2" {
  type = string
}
variable "VLAN21_SRV_name1" {
  type = string  
}
variable "VLAN21_SRV_name2" {
  type = string  
}
variable "VLAN21_SRV_GRP_NAME" {
  type = string
}


variable "VLAN30_IP" {
  type = string
}
variable "VLAN30_default_gw" {
  type = string
}
variable "VLAN30_start" {
  type = string
}
variable "VLAN30_end" {
  type = string
}
variable "VLAN30_int" {
  type = string
}
variable "VLAN30_subnet" {
    type = string
}
variable "VLAN30_name" {
    type = string
}
variable "VLAN30_name_net" {
  type = string
}
variable "VLAN30_usergroup" {
    type = string
}


variable "VLAN31_IP" {
  type = string
}
variable "VLAN31_default_gw" {
  type = string
}
variable "VLAN31_start" {
  type = string
}
variable "VLAN31_end" {
  type = string
}
variable "VLAN31_int" {
  type = string
}
variable "VLAN31_subnet" {
    type = string
}
variable "VLAN31_name" {
    type = string
}
variable "VLAN31_name_net" {
  type = string
}
variable "VLAN31_SRV_IP" {
  type = string
}
variable "VLAN31_SRV_IP_Subnet" {
  type = string
}
variable "VLAN31_SRV_port1" {
  type = string
}
variable "VLAN31_SRV_port2" {
  type = string
}
variable "VLAN31_SRV_name1" {
  type = string
}
variable "VLAN31_SRV_name2" {
  type = string
}
variable "VLAN31_SRV_GRP_NAME" {
  type = string
}


variable "VLAN40_IP" {
  type = string
}
variable "VLAN40_default_gw" {
  type = string
}
variable "VLAN40_start" {
  type = string
}
variable "VLAN40_end" {
  type = string
}
variable "VLAN40_int" {
  type = string
}
variable "VLAN40_subnet" {
    type = string
}
variable "VLAN40_name" {
    type = string
}
variable "VLAN40_name_net" {
  type = string
}


variable "VLAN50_IP" {
  type = string
}
variable "VLAN50_default_gw" {
  type = string
}
variable "VLAN50_start" {
  type = string
}
variable "VLAN50_end" {
  type = string
}
variable "VLAN50_int" {
  type = string
}
variable "VLAN50_subnet" {
    type = string
}
variable "VLAN50_name" {
    type = string
}
variable "VLAN50_name_net" {
  type = string
}
variable "VLAN50_SRV_name" {
  type = string
}
variable "VLAN50_SRV_IP_Subnet" {
  type = string
}


variable "VLAN60_IP" {
  type = string
}
variable "VLAN60_default_gw" {
  type = string
}
variable "VLAN60_start" {
  type = string
}
variable "VLAN60_end" {
  type = string
}
variable "VLAN60_int" {
  type = string
}
variable "VLAN60_subnet" {
    type = string
}
variable "VLAN60_name" {
    type = string
}
variable "VLAN60_name_net" {
  type = string
}


variable "VLAN70_IP" {
  type = string
}
variable "VLAN70_default_gw" {
  type = string
}
variable "VLAN70_start" {
  type = string
}
variable "VLAN70_end" {
  type = string
}
variable "VLAN70_int" {
  type = string
}
variable "VLAN70_subnet" {
    type = string
}
variable "VLAN70_name" {
    type = string
}
variable "VLAN70_name_net" {
  type = string
}
variable "VLAN70_usergroup" {
  type = string
}


variable "ap_type" {
  type = string
}

variable "ap_SN" {
    type = string
}

variable "wtp_profile" {
    type = string
}

variable "wtp_profile-legacy" {
    type = string
}

variable "SSID1" {
  type = string
}

variable "SSID2" {
  type = string
}

variable "SSID3" {
  type = string
}


variable "service_account" {
  type = string
}

variable "service_region" {
  type = string
}
