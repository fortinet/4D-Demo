resource "fortios_firewall_policy" "LAN_to_INTERNET" {
    name = "LAN_to_INTERNET"
    policyid = 10
    action = "accept"
    schedule = "always"
    utm_status = "enable"
    ssl_ssh_profile = "certificate-inspection"
    inspection_mode = "flow"
    av_profile = "CORP_AV"
    webfilter_profile = "CORP_WF"
    dnsfilter_profile = "CORP_DNS"
    ips_sensor = "CORP_IP"
    application_list = "CORP_AC"
    logtraffic = "all"
    nat = "enable"
    dstaddr_negate = "enable"
    srcintf {
      name = var.LAN_INT
    }
    dstintf {
      name = var.WAN_INT
    }
    srcaddr {
      name = "LAN"
    }
    dstaddr {
      name = "RFC-1918"
    }
    service {
      name = "ALL"
    }
	depends_on = [
		fortios_system_interface.LAN,
		fortios_firewall_address.LAN,
		fortios_firewall_addrgrp.RFC-1918
	]
}

resource "fortios_firewall_policy" "CORP_to_INTERNET" {
    name = "CORP_to_INTERNET"
    policyid = 100
    action = "accept"
    schedule = "always"
    utm_status = "enable"
    ssl_ssh_profile = "certificate-inspection"
    inspection_mode = "flow"
    av_profile = "CORP_AV"
    webfilter_profile = "CORP_WF"
    dnsfilter_profile = "CORP_DNS"
    ips_sensor = "CORP_IP"
    application_list = "CORP_AC"
    logtraffic = "all"
    nat = "enable"
    dstaddr_negate = "enable"
    srcintf {
      name = var.VLAN20_int
    }
    srcintf {
        name = var.VLAN30_int
    }
    srcintf {
      name = var.VLAN40_int
    }
    dstintf {
      name = var.WAN_INT
    }
    srcaddr {
      name = var.VLAN20_name
    }
    srcaddr {
      name = var.VLAN30_name
    }
    srcaddr {
       name = var.VLAN40_name
    }
    dstaddr {
      name = "RFC-1918"
    }
    service {
      name = "ALL"
    }
	depends_on = [
		fortios_system_interface.VLAN20,
		fortios_system_interface.VLAN30,
		fortios_system_interface.VLAN40,
		fortios_firewall_address.VLAN20,
		fortios_firewall_address.VLAN30,
		fortios_firewall_address.VLAN40,
		fortios_firewall_addrgrp.RFC-1918
	]
}

resource "fortios_firewall_policy" "LAB_to_INTERNET" {
    name = "LAB_to_INTERNET"
    policyid = 200
    action = "accept"
    schedule = "always"
    utm_status = "enable"
    ssl_ssh_profile = "certificate-inspection"
    inspection_mode = "flow"
    av_profile = "CORP_AV"
    webfilter_profile = "CORP_WF"
    dnsfilter_profile = "CORP_DNS"
    ips_sensor = "CORP_IP"
    application_list = "CORP_AC"
    logtraffic = "all"
    nat = "enable"
    dstaddr_negate = "enable"
    srcintf {
      name = var.VLAN21_int
    }
    srcintf {
      name = var.VLAN31_int
    }
    dstintf {
      name = var.WAN_INT
    }
    srcaddr {
      name = var.VLAN20_name_net
    }
    srcaddr {
      name = var.VLAN30_name_net
    }
    srcaddr {
       name = var.VLAN40_name_net
    }
    dstaddr {
      name = "RFC-1918"
    }
    service {
      name = "ALL"
    }
	depends_on = [
		fortios_system_interface.VLAN21,
		fortios_system_interface.VLAN31,
		fortios_firewall_address.VLAN20,
		fortios_firewall_address.VLAN30,
		fortios_firewall_address.VLAN40,
		fortios_firewall_addrgrp.RFC-1918
	]
}
resource "fortios_firewall_policy" "PHONES_to_SERVER" {
    name = "PHONES_to_SERVER"
    policyid = 300
    action = "accept"
    schedule = "always"
    logtraffic = "all"
    srcintf {
      name = var.VLAN60_int
    }
    dstintf {
      name = var.VLAN50_int
    }
    srcaddr {
      name = var.VLAN60_name_net
    }
    dstaddr {
      name = var.VLAN50_name_net
    }
    service {
      name = "H323"
    }
    service {
      name = "IRC"
    }
    service {
      name = "MGCP"
    }
    service {
      name = "MS-SQL"
    }
    service {
      name = "MYSQL"
    }    
    service {
      name = "RTSP"
    }
    service {
      name = "SCCP"
    }
    service {
      name = "SIP"
    }
    service {
      name = "SIP-MSNmessenger"
    }
	depends_on = [
		fortios_system_interface.VLAN50,
		fortios_system_interface.VLAN60,
		fortios_firewall_address.VLAN60_net,
		fortios_firewall_address.VLAN50_net
	]
}

resource "fortios_firewall_policy" "IOT_to_INTERNET" {
    name = "IOT_to_INTERNET"
    policyid = 400
    action = "accept"
    schedule = "always"
    utm_status = "enable"
    ssl_ssh_profile = "certificate-inspection"
    inspection_mode = "flow"
    av_profile = "CORP_AV"
    webfilter_profile = "CORP_WF"
    dnsfilter_profile = "CORP_DNS"
    ips_sensor = "CORP_IP"
    application_list = "CORP_AC"
    logtraffic = "all"
    nat = "enable"
    dstaddr_negate = "enable"
    srcintf {
      name = var.VLAN70_int
    }
    dstintf {
        name = var.WAN_INT
    }
    srcaddr {
      name = var.VLAN70_name_net
    }
    srcaddr {
      name = var.VLAN30_name
    }
    srcaddr {
       name = var.VLAN40_name
    }
    dstaddr {
      name = "RFC-1918"
    }
    service {
      name = "ALL"
    }
	depends_on = [
		fortios_system_interface.VLAN70,
		fortios_firewall_address.VLAN70_net,
		fortios_firewall_address.VLAN30,
		fortios_firewall_address.VLAN40,
		fortios_firewall_addrgrp.RFC-1918
	]
}
resource "fortios_firewall_policy" "EMPLOYEE_CORP_SERVICES" {
    name = "EMPLOYEE_CORP_SERVICES"
    policyid = 500
    action = "accept"
    schedule = "always"
    utm_status = "enable"
    ssl_ssh_profile = "certificate-inspection"
    inspection_mode = "flow"
    av_profile = "CORP_AV"
    webfilter_profile = "CORP_WF"
    dnsfilter_profile = "CORP_DNS"
    ips_sensor = "CORP_IP"
    application_list = "CORP_AC"
    logtraffic = "all"
    srcintf {
      name = var.VLAN20_int
    }
    srcintf {
      name = var.VLAN30_int
    }
    srcintf {
      name = var.VLAN40_int
    }
    srcintf {
      name = var.VLAN60_int
    }
    srcintf {
      name = var.VLAN70_int
    }
    dstintf {
      name = var.VLAN50_int
    }
    srcaddr {
      name = var.VLAN20_name_net
    }
    srcaddr {
      name = var.VLAN30_name_net
    }
    srcaddr {
       name = var.VLAN40_name_net
    }
    srcaddr {
       name = var.VLAN60_name_net
    }
    srcaddr {
       name = var.VLAN70_name_net
    }
    dstaddr {
      name = var.VLAN50_SRV_name
    }
    service {
      name = "ALL"
    }
	depends_on = [
		fortios_system_interface.VLAN20,
		fortios_system_interface.VLAN30,
		fortios_system_interface.VLAN40,
		fortios_system_interface.VLAN50,
		fortios_system_interface.VLAN60,
		fortios_system_interface.VLAN70,
		fortios_firewall_address.VLAN20_net,
		fortios_firewall_address.VLAN30_net,
		fortios_firewall_address.VLAN40_net,
		fortios_firewall_address.VLAN60_net,
		fortios_firewall_address.VLAN70_net,
		fortios_firewall_address.VLAN50_SRV
	]
}
resource "fortios_firewall_policy" "ENGINEERING_to_ENG_LAB" {
    name = "ENGINEERING_to_ENG_LAB"
    policyid = 600
    action = "accept"
    schedule = "always"
    utm_status = "enable"
    ssl_ssh_profile = "certificate-inspection"
    inspection_mode = "flow"
    av_profile = "CORP_AV"
    webfilter_profile = "CORP_WF"
    dnsfilter_profile = "CORP_DNS"
    ips_sensor = "CORP_IP"
    application_list = "CORP_AC"
    logtraffic = "all"
    srcintf {
      name = var.VLAN30_int
    }
    dstintf {
      name = var.VLAN31_int
    }
    srcaddr {
      name = var.VLAN30_name_net
    }
    dstaddr {
      name = var.VLAN31_name_net
    }
    service {
      name = fortios_firewallservice_group.VLAN31_SERVICES.name
    }
	depends_on = [
		fortios_system_interface.VLAN30,
		fortios_system_interface.VLAN31,
		fortios_firewall_address.VLAN30_net,
		fortios_firewall_address.VLAN31_net,
		fortios_firewallservice_group.VLAN31_SERVICES
	]
}
resource "fortios_firewall_policy" "IT_to_IT_LAB" {
    name = "IT_to_IT_LAB"
    policyid = 700
    action = "accept"
    schedule = "always"
    utm_status = "enable"
    ssl_ssh_profile = "certificate-inspection"
    inspection_mode = "flow"
    av_profile = "CORP_AV"
    webfilter_profile = "CORP_WF"
    dnsfilter_profile = "CORP_DNS"
    ips_sensor = "CORP_IP"
    application_list = "CORP_AC"
    logtraffic = "all"
    srcintf {
      name = var.VLAN20_int
    }
    dstintf {
      name = var.VLAN21_int
    }
    srcaddr {
      name = var.VLAN20_name_net
    }
    dstaddr {
      name = var.VLAN21_name_net
    }
    service {
      name = fortios_firewallservice_group.VLAN21_SERVICES.name
    }
	depends_on = [
		fortios_system_interface.VLAN20,
		fortios_system_interface.VLAN21,
		fortios_firewall_address.VLAN20_net,
		fortios_firewall_address.VLAN21_net,
		fortios_firewallservice_group.VLAN21_SERVICES
	]
}