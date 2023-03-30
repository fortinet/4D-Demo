resource "fortios_ips_sensor" "CORP_IP" {
    name = "CORP_IP"
    comment = "Block medium, high, and critical attacks"
    block_malicious_url = "enable"
    scan_botnet_connections = "block"
    entries {
      id = 1
      severity = "medium high critical"
      action = "block"
    }
}