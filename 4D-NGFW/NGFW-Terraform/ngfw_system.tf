resource "fortios_system_fortiguard" "fortiguard" {
    service_account_id = var.service_account
    update_server_location = var.service_region
	outbreak_prevention_timeout = "7"
	antispam_timeout = "7"
	webfilter_timeout = "15"
}

resource "fortios_logfortiguard_setting" "logging" {
    status = "enable"
    upload_option = "realtime"
}

resource "fortios_switchcontroller_system" "switch" {
    tunnel_mode = "strict"
}
resource "fortios_system_autoinstall" "autoinstall" {
    auto_install_config = "disable"
    auto_install_image = "disable"
}

resource "fortios_system_settings" "multiple_int_policy" {
  gui_multiple_interface_policy = "enable"
}