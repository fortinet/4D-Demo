resource "fortios_system_global" "global" {
  admin_lockout_duration = "1800"
  admin_lockout_threshold = "10"
  admin_maintainer = "disable"
  #note that changing the below port will require an update to the 'host' variable in terraform.tfvars
  admin_sport = var.admin_https_port
  admin_ssh_port = var.admin_ssh_port
  hostname = var.hostname
}