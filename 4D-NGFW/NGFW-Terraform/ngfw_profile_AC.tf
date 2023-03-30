resource "fortios_application_list" "CORP_AC" {
    name = "CORP_AC"
    unknown_application_log = "enable"
    entries {
        id = 1
        category {
            id = 2
        }
        category {
            id = 6
        }
    }
    entries {
        id = 2
        action = "pass"
    }
}