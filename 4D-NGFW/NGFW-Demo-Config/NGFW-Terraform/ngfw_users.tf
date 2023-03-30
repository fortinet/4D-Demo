# Define the user groups to be used in policies
resource "fortios_user_group" "Admin" {
    name = "Admin"
    match {
        server_name = var.radname
        group_name = "FirewallAdmin"
    }
    member {
        name = var.radname
    }
	depends_on = [
		fortios_user_radius.radius
	]
}
resource "fortios_user_group" "VLAN20_usergroup" {
    name = var.VLAN20_usergroup
    match {
        server_name = var.radname
        group_name = var.VLAN20_usergroup
    }
    member {
        name = var.radname
    }
	depends_on = [
		fortios_user_radius.radius
	]
}
resource "fortios_user_group" "VLAN30_usergroup" {
    name = var.VLAN30_usergroup
    match {
        server_name = var.radname
        group_name = var.VLAN30_usergroup
    }
    member {
        name = var.radname
    }
	depends_on = [
		fortios_user_radius.radius
	]
}
resource "fortios_user_group" "VLAN70_usergroup" {
    name = var.VLAN70_usergroup
    match {
        server_name = var.radname
        group_name = var.VLAN70_usergroup
    }
    member {
        name = var.radname
    }
	depends_on = [
		fortios_user_radius.radius
	]
}