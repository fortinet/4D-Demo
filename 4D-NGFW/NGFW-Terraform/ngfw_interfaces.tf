/*
resource "fortios_system_interface" "wan2" {
  vdom = "root"
  name = "wan2"
  type = "physical"
  status = "down"
}
resource "fortios_system_interface" "dmz" {
  vdom = "root"
  type = "physical"
  name = "dmz"
  status = "down"
}
*/
resource "fortios_system_interface" "LAN" {
  vdom = "root"
  type = "physical"
  name = var.LAN_INT
  ip = var.LAN_addr
  allowaccess = "fabric https" # https is only needed for configuration.
  alias = "LAN"
  device_identification = "enable"
  lldp_transmission = "enable"
  role = "lan"
}
resource "fortios_systemdhcp_server" "LAN_dhcp" {
    dns_service = "default"
    default_gateway = var.vlan1_default_gw
    netmask = var.vlan_netmask
    interface = var.LAN_INT
    ip_range {
        start_ip = var.vlan1_start
        end_ip = var.vlan1_end
    }
	depends_on = [
		fortios_system_interface.LAN
	]
}

resource "fortios_system_interface" "MGMT" {
  vdom = "root"
  name = var.MGMT_INT
  type = "physical"
  ip = var.MGMT_addr
  allowaccess = "ping https ssh"
  alias = "MGMT"
  device_identification = "enable"
  role = "dmz"
  status = "up"
  lldp_transmission = "enable"
}
/*
resource "fortios_system_interface" "internal" {
  vdom = "root"
  type = "hard-switch"
  name = "internal"
  status = "down"
  ip = "0.0.0.0 0.0.0.0"
}
resource "fortios_system_interface" "fortilink" {
  vdom = "root"
  type = "aggregate"
  name = "fortilink"
  status = "down"
}
*/
resource "fortios_system_interface" "VLAN20" {
  vdom = "root"
  name = var.VLAN20_name
  ip = var.VLAN20_IP
  allowaccess = "ping fabric"
  device_identification = "enable"
  role = "lan"
  interface = var.LAN_INT
  vlanid = 20
}
resource "fortios_systemdhcp_server" "VLAN20_dhcp" {
    dns_service = "default"
    default_gateway = var.VLAN20_default_gw
    netmask = var.vlan_netmask
    interface = var.VLAN20_int
    ip_range {
        start_ip = var.VLAN20_start
        end_ip = var.VLAN20_end
    }
	depends_on = [
		fortios_system_interface.VLAN20
	]
}

resource "fortios_system_interface" "VLAN21" {
  vdom = "root"
  name = var.VLAN21_name
  ip = var.VLAN21_IP
  allowaccess = "ping fabric"
  device_identification = "enable"
  role = "lan"
  interface = var.LAN_INT
  vlanid = 21
}
resource "fortios_systemdhcp_server" "VLAN21_dhcp" {
    dns_service = "default"
    default_gateway = var.VLAN21_default_gw
    netmask = var.vlan_netmask
    interface = var.VLAN21_int
    ip_range {
        start_ip = var.VLAN21_start
        end_ip = var.VLAN21_end
    }
	depends_on = [
		fortios_system_interface.VLAN21
	]
}

resource "fortios_system_interface" "VLAN30" {
  vdom = "root"
  name = var.VLAN30_name
  ip = var.VLAN30_IP
  allowaccess = "ping fabric"
  device_identification = "enable"
  role = "lan"
  interface = var.LAN_INT
  vlanid = 30
}
resource "fortios_systemdhcp_server" "VLAN30_dhcp" {
    dns_service = "default"
    default_gateway = var.VLAN30_default_gw
    netmask = var.vlan_netmask
    interface = var.VLAN30_int
    ip_range {
        start_ip = var.VLAN30_start
        end_ip = var.VLAN30_end
    }
	depends_on = [
		fortios_system_interface.VLAN30
	]
}
resource "fortios_system_interface" "VLAN31" {
  vdom = "root"
  name = var.VLAN31_name
  ip = var.VLAN31_IP
  allowaccess = "ping fabric"
  device_identification = "enable"
  role = "lan"
  interface = var.LAN_INT
  vlanid = 31
}
resource "fortios_systemdhcp_server" "VLAN31_dhcp" {
    dns_service = "default"
    default_gateway = var.VLAN31_default_gw
    netmask = var.vlan_netmask
    interface = var.VLAN31_int
    ip_range {
        start_ip = var.VLAN31_start
        end_ip = var.VLAN31_end
    }
	depends_on = [
		fortios_system_interface.VLAN31
	]
}
resource "fortios_system_interface" "VLAN40" {
  vdom = "root"
  name = var.VLAN40_name
  ip = var.VLAN40_IP
  allowaccess = "ping fabric"
  device_identification = "enable"
  role = "lan"
  interface = var.LAN_INT
  vlanid = 40
}
resource "fortios_systemdhcp_server" "VLAN40_dhcp" {
    dns_service = "default"
    default_gateway = var.VLAN40_default_gw
    netmask = var.vlan_netmask
    interface = var.VLAN40_int
    ip_range {
        start_ip = var.VLAN40_start
        end_ip = var.VLAN40_end
    }
	depends_on = [
		fortios_system_interface.VLAN40
	]
}
resource "fortios_system_interface" "VLAN50" {
  vdom = "root"
  name = var.VLAN50_name
  ip = var.VLAN50_IP
  allowaccess = "ping fabric"
  device_identification = "enable"
  role = "lan"
  interface = var.LAN_INT
  vlanid = 50
}
resource "fortios_systemdhcp_server" "VLAN50_dhcp" {
    dns_service = "default"
    default_gateway = var.VLAN50_default_gw
    netmask = var.vlan_netmask
    interface = var.VLAN50_int
    ip_range {
        start_ip = var.VLAN50_start
        end_ip = var.VLAN50_end
    }
	depends_on = [
		fortios_system_interface.VLAN50
	]
}
resource "fortios_system_interface" "VLAN60" {
  vdom = "root"
  name = var.VLAN60_name
  ip = var.VLAN60_IP
  allowaccess = "ping fabric"
  device_identification = "enable"
  role = "lan"
  interface = var.LAN_INT
  vlanid = 60
}
resource "fortios_systemdhcp_server" "VLAN60_dhcp" {
    dns_service = "default"
    default_gateway = var.VLAN60_default_gw
    netmask = var.vlan_netmask
    interface = var.VLAN60_int
    ip_range {
        start_ip = var.VLAN60_start
        end_ip = var.VLAN60_end
    }
	depends_on = [
		fortios_system_interface.VLAN60
	]
}
resource "fortios_system_interface" "VLAN70" {
  vdom = "root"
  name = var.VLAN70_name
  ip = var.VLAN70_IP
  allowaccess = "ping fabric"
  device_identification = "enable"
  role = "lan"
  interface = var.LAN_INT
  vlanid = 70
}
resource "fortios_systemdhcp_server" "VLAN70_dhcp" {
    dns_service = "default"
    default_gateway = var.VLAN70_default_gw
    netmask = var.vlan_netmask
    interface = var.VLAN70_int
    ip_range {
        start_ip = var.VLAN70_start
        end_ip = var.VLAN70_end
    }
	depends_on = [
		fortios_system_interface.VLAN70
	]
}
