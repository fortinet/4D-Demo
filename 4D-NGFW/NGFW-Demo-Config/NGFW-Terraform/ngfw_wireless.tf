resource "fortios_wirelesscontroller_wtpprofile" "Corp_Wireless" {
  name = var.wtp_profile
  handoff_sta_thresh = "30"
  platform {
    type = var.ap_type
  }
  radio_1 {
    band = "802.11n,g-only"
    vap_all = "bridge"
    channel {
      chan = "1"
    }
    channel {
        chan = "6"
    }
    channel {
        chan = "11"
    }
  }
  radio_2 {
    band = "802.11ac"
    vap_all = "bridge"
    channel {
        chan = "36"
    }
    channel {
        chan = "40"
    }
    channel {
        chan = "44"
    }
    channel {
        chan = "48"
    }
    channel {
        chan = "52"
    }
    channel {
        chan = "56"
    }
    channel {
        chan = "60"
    }
    channel {
        chan = "64"
    }
    channel {
        chan = "100"
    }
    channel {
        chan = "104"
    }
    channel {
        chan = "108"
    }
    channel {
        chan = "112"
    }
    channel {
        chan = "116"
    }
    channel {
        chan = "120"
    }
    channel {
        chan = "124"
    }
    channel {
        chan = "128"
    }
    channel {
        chan = "132"
    }
    channel {
        chan = "136"
    }
    channel {
        chan = "140"
    }
    channel {
        chan = "144"
    }
    channel {
        chan = "149"
    }
    channel {
        chan = "153"
    }
    channel {
        chan = "157"
    }
    channel {
        chan = "161"
    }
    channel {
        chan = "165"
    }
  }
}

resource "fortios_wirelesscontroller_wtp" AP {
    admin = "enable"
    name = var.ap_SN
    wtp_profile = var.wtp_profile       # Apply the wtp_profile here. However, when using a legacy FAP, change the variable to var.wtp_profile-legacy, and uncomment the radio_1 and radio_2 settings below
/*
	radio_1 {
		override_vaps = "enable"
		vap_all = "bridge"
	}
	radio_2 {
		override_vaps = "enable"
		vap_all = "bridge"
	}
*/
}

resource "fortios_wirelesscontroller_vap" SSID1 {
    name = var.SSID1
    schedule = "always"
    ssid = var.SSID1
    security = "wpa2-only-enterprise"
    auth = "usergroup"
    local_bridging = "enable"
    usergroup {
      name = var.VLAN20_usergroup
    }
    vlanid = 20
	depends_on = [
		fortios_user_group.VLAN20_usergroup
	]
}

resource "fortios_wirelesscontroller_vap" SSID2 {
    name = var.SSID2
    ssid = var.SSID2
    security = "wpa2-only-enterprise"
    auth = "usergroup"
    local_bridging = "enable"
    usergroup {
      name = var.VLAN70_usergroup
    }
    schedule = "always"
    vlanid = 70
	depends_on = [
		fortios_user_group.VLAN70_usergroup
	]
}

resource "fortios_wirelesscontroller_vap" SSID3 {
    name = var.SSID3
    ssid = var.SSID3
    security = "wpa2-only-enterprise"
    auth = "usergroup"
    local_bridging = "enable"
    usergroup {
      name = var.VLAN30_usergroup
    }
    schedule = "always"
    vlanid = 30
	depends_on = [
		fortios_user_group.VLAN30_usergroup
	]
}