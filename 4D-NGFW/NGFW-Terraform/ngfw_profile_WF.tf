resource "fortios_webfilter_profile" "CORP_WF" {
  name = "CORP_WF"
  options = "block-invalid-url"
  web {
    blocklist = "enable"
  }
  ftgd_wf {
    filters {
        action = "block"
        category = 1
    }
    filters {
        action = "block"
        category = 2
    }
    filters {
        action = "block"
        category = 3
    }
    filters {
        action = "block"
        category = 4
    }
    filters {
        action = "block"
        category = 5
    }
    filters {
        action = "block"
        category = 6
    }
    filters {
        action = "block"
        category = 7
    }
    filters {
        action = "block"
        category = 8
    }
    filters {
        action = "block"
        category = 9
    }
    filters {
        action = "block"
        category = 11
    }
    filters {
        action = "block"
        category = 12
    }
    filters {
        action = "block"
        category = 13
    }
    filters {
        action = "block"
        category = 14
    }
    filters {
        action = "block"
        category = 15
    }
    filters {
        action = "block"
        category = 16
    }
    filters {
        action = "warning"
        category = 17
    }
    filters {
        action = "block"
        category = 18
    }
    filters {
        action = "block"
        category = 19
    }
    filters {
        action = "block"
        category = 20
    }
    filters {
        action = "block"
        category = 23
    }
    filters {
        action = "block"
        category = 24
    }
    filters {
        action = "block"
        category = 25
    }
    filters {
        action = "block"
        category = 26
    }
    filters {
        category = 28
    }
    filters {
        category = 29
    }
    filters {
        category = 30
    }
    filters {
        category = 31
    }
    filters {
        category = 33
    }
    filters {
        category = 34
    }
    filters {
        action = "block"
        category = 59
    }
    filters {
      action = "block"
      category = 62
    }
    filters {
      action = "block"
      category = 83
    }
    filters {
      action = "block"
      category = 96
    }
    filters {
      action = "block"
      category = 98
    }
    filters {
      action = "block"
      category = 99
    }
    filters {
      action = "block"
      category = 57
    }
    filters {
      action = "block"
      category = 63
    }
    filters {
      action = "block"
      category = 64
    }
    filters {
      action = "block"
      category = 65
    }
    filters {
      action = "block"
      category = 66
    }
    filters {
      action = "block"
      category = 67
    }
    filters {
      action = "block"
      category = 72
    }
    filters {
      category = 75
    }
    filters {
      category = 76
    }
    filters {
        action = "block"
        category = 61
    }
    filters {
        action = "block"
        category = 86
    }
    filters {
        action = "block"
        category = 88
    }
    filters {
        action = "block"
        category = 90
    }
    filters {
        action = "block"
        category = 91
    }
    filters {
        category = 35
    }
    filters {
        category = 36
    }
    filters {
        category = 37
    }
    filters {
        category = 38
    }
    filters {
        category = 39
    }
    filters {
        category = 40
    }
    filters {
        category = 42
    }
    filters {
        category = 44
    }
    filters {
        category = 46
    }
    filters {
        category = 47
    }
    filters {
        category = 48
    }
    filters {
        category = 54
    }
    filters {
        category = 55
    }
    filters {
        category = 58
    }
    filters {
        category = 68
    }
    filters {
        category = 69
    }
    filters {
        category = 70
    }
    filters {
        category = 71
    }
    filters {
        category = 77
    }
    filters {
        category = 78
    }
    filters {
        category = 79
    }
    filters {
        category = 80
    }
    filters {
        category = 82
    }
    filters {
        category = 85
    }
    filters {
        category = 87
    }
    filters {
        category = 89
    }
    filters {
        category = 41
    }
    filters {
        category = 43
    }
    filters {
        category = 49
    }
    filters {
        category = 50
    }
    filters {
        category = 51
    }
    filters {
        category = 52
    }
    filters {
        category = 53
    }
    filters {
        category = 56
    }
    filters {
        category = 81
    }
    filters {
        category = 84
    }
    filters {
        category = 92
    }
    filters {
        category = 93
    }
    filters {
        category = 94
    }
    filters {
        category = 95
    }
    filters {
        category = 97
    }
    filters {
        action = "block"
    }
  }
}