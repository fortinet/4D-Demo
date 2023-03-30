resource "fortios_user_radius" "radius" {
  name = var.radname
  server = var.radserver
  secret = var.radpass
}