resource "fortios_firewall_address" "LAN" {
    name = "LAN"
    subnet = var.vlan1_subnet
}
resource "fortios_firewall_address" "VLAN20" {
    name = var.VLAN20_name
    subnet = var.VLAN20_subnet
}
resource "fortios_firewall_address" "VLAN21" {
    name = var.VLAN21_name
    subnet = var.VLAN21_subnet
}
# Two firewall address objects are created for the same IP to keep the naming convention for the service group.
# This simplifies the template to account for using a second server/IP address at the expense of duplicating the object for services hosted on the same IP address.
resource "fortios_firewall_address" "VLAN21_SRV1" {
  name = var.VLAN21_SRV_name1
  subnet = var.VLAN21_SRV_IP_Subnet
  associated_interface = var.VLAN21_name
  depends_on = [
		fortios_system_interface.VLAN21
	]
}
resource "fortios_firewall_address" "VLAN21_SRV2" {
  name = var.VLAN21_SRV_name2
  subnet = var.VLAN21_SRV_IP_Subnet
  associated_interface = var.VLAN21_name
  depends_on = [
		fortios_system_interface.VLAN21
	]
}
resource "fortios_firewall_address" "VLAN30" {
    name = var.VLAN30_name
    subnet = var.VLAN30_subnet
}
resource "fortios_firewall_address" "VLAN31" {
    name = var.VLAN31_name
    subnet = var.VLAN31_subnet
}
resource "fortios_firewall_address" "VLAN31_SRV1" {
  name = var.VLAN31_SRV_name1
  subnet = var.VLAN31_SRV_IP_Subnet
  associated_interface = var.VLAN31_name
  depends_on = [
		fortios_system_interface.VLAN31
	]
}
resource "fortios_firewall_address" "VLAN31_SRV2" {
  name = var.VLAN31_SRV_name2
  subnet = var.VLAN31_SRV_IP_Subnet
  associated_interface = var.VLAN31_name
  depends_on = [
		fortios_system_interface.VLAN31
	]
}
resource "fortios_firewall_address" "VLAN40" {
    name = var.VLAN40_name
    subnet = var.VLAN40_subnet
}
resource "fortios_firewall_address" "VLAN50" {
    name = var.VLAN50_name
    subnet = var.VLAN50_subnet
}
resource "fortios_firewall_address" "VLAN50_SRV" {
  name = var.VLAN50_SRV_name
  subnet = var.VLAN50_SRV_IP_Subnet
  associated_interface = var.VLAN50_name
  depends_on = [
		fortios_system_interface.VLAN50
	]
}
resource "fortios_firewall_address" "VLAN60" {
    name = var.VLAN60_name
    subnet = var.VLAN60_subnet
}
resource "fortios_firewall_address" "VLAN70" {
    name = var.VLAN70_name
    subnet = var.VLAN70_subnet
}
resource "fortios_firewall_address" "RFC-1918-10" {
    name = "RFC-1918-10"
    subnet = "10.0.0.0 255.0.0.0"
}
resource "fortios_firewall_address" "RFC-1918-172" {
    name = "RFC-1918-172"
    subnet = "172.16.0.0 255.240.0.0"
}
resource "fortios_firewall_address" "RFC-1918-192" {
    name = "RFC-1918-192"
    subnet = "192.168.0.0 255.255.255.0"
}
resource "fortios_firewall_addrgrp" "RFC-1918" {
    name = "RFC-1918"
    member {
        name = fortios_firewall_address.RFC-1918-10.name
    }
	member {
        name = fortios_firewall_address.RFC-1918-172.name
    }
	member {
        name = fortios_firewall_address.RFC-1918-192.name
    }
}
resource "fortios_firewall_address" "VLAN20_net" {
  name = var.VLAN20_name_net
  subnet = var.VLAN20_subnet
}
resource "fortios_firewall_address" "VLAN21_net" {
  name = var.VLAN21_name_net
  subnet = var.VLAN21_subnet
}
resource "fortios_firewall_address" "VLAN30_net" {
  name = var.VLAN30_name_net
  subnet = var.VLAN30_subnet
}
resource "fortios_firewall_address" "VLAN31_net" {
  name = var.VLAN31_name_net
  subnet = var.VLAN31_subnet
}
resource "fortios_firewall_address" "VLAN40_net" {
  name = var.VLAN40_name_net
  subnet = var.VLAN40_subnet
}
resource "fortios_firewall_address" "VLAN50_net" {
  name = var.VLAN50_name_net
  subnet = var.VLAN50_subnet
}
resource "fortios_firewall_address" "VLAN60_net" {
  name = var.VLAN60_name_net
  subnet = var.VLAN60_subnet
}
resource "fortios_firewall_address" "VLAN70_net" {
  name = var.VLAN70_name_net
  subnet = var.VLAN70_subnet
}