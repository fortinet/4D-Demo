terraform {
  required_providers {
    fortios = {
      source = "fortinetdev/fortios"
      version = "1.16.0"
    }
  }
}

provider "fortios" {
  hostname = var.host
  token = var.token
  insecure = "true"
}