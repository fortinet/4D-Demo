  resource "fortios_system_accprofile" "FWAdmin_profile" {
    name                  = "FWAdmin_profile"
    scope                 = "vdom"
    secfabgrp             = "read-write"
    ftviewgrp             = "read-write"
    authgrp               = "read-write"
    sysgrp                = "read-write"
    netgrp                = "read-write"
    loggrp                = "read-write"
    fwgrp                 = "read-write"
    vpngrp                = "read-write"
    utmgrp                = "read-write"
#    wanoptgrp             = "read-write"
    wifi                  = "read-write"
}

resource "fortios_system_admin" "FWAdmin" {
    name = "FWAdmin"
    remote_auth = "enable"
    trusthost1 = var.trusthost
    accprofile = "FWAdmin_profile"
    vdom {
            name = "root"
    }
    two_factor = "fortitoken"     # Comment out if not using 2FA authentication
    fortitoken = var.fortitoken   # If using 2FA, go into System > Administrator, edit the FWAdmin and click send Activation Code Email to activate
    email_to = var.adminemail
    remote_group = "Admin"
    password = var.adminpassword
    comments = "NGFW Remote Admin"
	depends_on = [
		fortios_user_group.Admin
	]
}
