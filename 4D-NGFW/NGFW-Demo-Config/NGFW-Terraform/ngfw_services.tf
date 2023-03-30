/*resource "fortios_firewallservice_custom" "VLAN21_SRV1" {
  name = var.VLAN21_SRV_name1
  iprange = var.VLAN21_SRV_IP
  tcp_portrange = var.VLAN21_SRV_port1
}
resource "fortios_firewallservice_custom" "VLAN21_SRV2" {
  name = var.VLAN21_SRV_name2
  iprange = var.VLAN21_SRV_IP
  tcp_portrange = var.VLAN21_SRV_port2
}
resource "fortios_firewallservice_custom" "VLAN31_SRV1" {
  name = var.VLAN31_SRV_name1
  iprange = var.VLAN31_SRV_IP
  tcp_portrange = var.VLAN31_SRV_port1
}
resource "fortios_firewallservice_custom" "VLAN31_SRV2" {
  name = var.VLAN31_SRV_name2
  iprange = var.VLAN31_SRV_IP
  tcp_portrange = var.VLAN31_SRV_port2
}
resource "fortios_firewallservice_group" "VLAN21_SERVICES" {
    name = var.VLAN21_SRV_GRP_NAME
    member {
      name = var.VLAN21_SRV_name1
    }
    member {
      name = var.VLAN21_SRV_name2
    }
}
resource "fortios_firewallservice_group" "VLAN31_SERVICES" {
    name = var.VLAN31_SRV_GRP_NAME
    member {
      name = var.VLAN31_SRV_name1
    }
    member {
      name = var.VLAN31_SRV_name2
    }
}*/
resource "fortios_firewallservice_custom" "VLAN21_SRV1" {
  name = var.VLAN21_SRV_name1
  iprange = var.VLAN21_SRV_IP
  tcp_portrange = var.VLAN21_SRV_port1
}
resource "fortios_firewallservice_custom" "VLAN21_SRV2" {
  name = var.VLAN21_SRV_name2
  iprange = var.VLAN21_SRV_IP
  tcp_portrange = var.VLAN21_SRV_port2
}
resource "fortios_firewallservice_group" "VLAN21_SERVICES" {
    name = var.VLAN21_SRV_GRP_NAME
    member {
      name = fortios_firewallservice_custom.VLAN21_SRV1.name
    }
    member {
      name = fortios_firewallservice_custom.VLAN21_SRV2.name
    }
}

resource "fortios_firewallservice_custom" "VLAN31_SRV1" {
  name = var.VLAN31_SRV_name1
  iprange = var.VLAN31_SRV_IP
  tcp_portrange = var.VLAN31_SRV_port1
}
resource "fortios_firewallservice_custom" "VLAN31_SRV2" {
  name = var.VLAN31_SRV_name2
  iprange = var.VLAN31_SRV_IP
  tcp_portrange = var.VLAN31_SRV_port2
}
resource "fortios_firewallservice_group" "VLAN31_SERVICES" {
    name = var.VLAN31_SRV_GRP_NAME
    member {
      name = fortios_firewallservice_custom.VLAN31_SRV1.name
    }
    member {
      name = fortios_firewallservice_custom.VLAN31_SRV2.name
    }
}