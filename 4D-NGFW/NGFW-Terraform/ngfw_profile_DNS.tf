resource "fortios_dnsfilter_profile" "CORP_DNS" {
    name = "CORP_DNS"
    block_botnet = "enable"
    ftgd_dns {
      filters {
        id              = 1
        category        = 1
        action          = "block"
      }
      filters {
        id              = 2
        category        = 3
        action          = "block"
      }
      filters {
        id              = 3
        category        = 4
        action          = "block"
      }
      filters {
        id              = 4
        category        = 5
        action          = "block"
      }
      filters {
        id              = 5
        category        = 6
        action          = "block"
      }
      filters {
        id              = 6
        category        = 12
        action          = "block"
      }
      filters {
        id              = 7
        category        = 59
        action          = "block"
      }
      filters {
        id              = 8
        category        = 62
        action          = "block"
      }
      filters {
        id              = 9
        category        = 83
        action          = "block"
      }
      filters {
        id              = 10
        category        = 96
        action          = "block"
      }
      filters {
        id              = 11
        category        = 98
        action          = "block"
      }
      filters {
        id              = 12
        category        = 99
        action          = "block"
      }
      filters {
        id              = 13
        category        = 2
        action          = "block"
      }
      filters {
        id              = 14
        category        = 7
        action          = "block"
      }
      filters {
        id              = 15
        category        = 8
        action          = "block"
      }
      filters {
        id              = 16
        category        = 9
        action          = "block"
      }
      filters {
        id              = 17
        category        = 11
        action          = "block"
      }
      filters {
        id              = 18
        category        = 13
        action          = "block"
      }
      filters {
        id              = 19
        category        = 14
        action          = "block"
      }
      filters {
        id              = 20
        category        = 15
        action          = "block"
      }
      filters {
        id              = 21
        category        = 16
        action          = "block"
      }
      filters {
        id              = 22
        category        = 57
        action          = "block"
      }
      filters {
        id              = 23
        category        = 63
        action          = "block"
      }
      filters {
        id              = 24
        category        = 64
        action          = "block"
      }
      filters {
        id              = 25
        category        = 65
        action          = "block"
      }
      filters {
        id              = 26
        category        = 66
        action          = "block"
      }
      filters {
        id              = 27
        category        = 67
        action          = "block"
      }
      filters {
        id              = 28
        category        = 19
        action          = "block"
      }
      filters {
        id              = 29
        category        = 24
        action          = "block"
      }
      filters {
        id              = 30
        category        = 25
        action          = "block"
      }
      filters {
        id              = 31
        category        = 72
        action          = "block"
      }
      filters {
        id              = 32
        category        = 75
      }
      filters {
        id              = 33
        category        = 76
      }
      filters {
        id              = 34
        category        = 26
        action          = "block"
      }
      filters {
        id              = 35
        category        = 61
        action          = "block"
      }
      filters {
        id              = 36
        category        = 86
        action          = "block"
      }
      filters {
        id              = 37
        category        = 88
        action          = "block"
      }
      filters {
        id              = 38
        category        = 90
        action          = "block"
      }
      filters {
        id              = 39
        category        = 91
        action          = "block"
      }
      filters {
        id              = 40
        category        = 17
      }
      filters {
        id              = 41
        category        = 18
      }
      filters {
        id              = 42
        category        = 20
      }
      filters {
        id              = 43
        category        = 23
      }
      filters {
        id              = 44
        category        = 28
      }
      filters {
        id              = 45
        category        = 29
      }
      filters {
        id              = 46
        category        = 30
      }
      filters {
        id              = 47
        category        = 33
      }
      filters {
        id              = 48
        category        = 34
      }
      filters {
        id              = 49
        category        = 35
      }
      filters {
        id              = 50
        category        = 36
      }
      filters {
        id              = 51
        category        = 37
      }
      filters {
        id              = 52
        category        = 38
      }
      filters {
        id              = 53
        category        = 39
      }
      filters {
        id              = 54
        category        = 40
      }
      filters {
        id              = 55
        category        = 42
      }
      filters {
        id              = 56
        category        = 44
      }
      filters {
        id              = 57
        category        = 46
      }
      filters {
        id              = 58
        category        = 47
      }
      filters {
        id              = 59
        category        = 48
      }
      filters {
        id              = 60
        category        = 54
      }
      filters {
        id              = 61
        category        = 55
      }
      filters {
        id              = 62
        category        = 58
      }
      filters {
        id              = 63
        category        = 68
      }
      filters {
        id              = 64
        category        = 69
      }
      filters {
        id              = 65
        category        = 70
      }
      filters {
        id              = 66
        category        = 71
      }
      filters {
        id              = 67
        category        = 77
      }
      filters {
        id              = 68
        category        = 78
      }
      filters {
        id              = 69
        category        = 79
      }
      filters {
        id              = 70
        category        = 80
      }
      filters {
        id              = 71
        category        = 82
      }
      filters {
        id              = 72
        category        = 85
      }
      filters {
        id              = 73
        category        = 87
      }
      filters {
        id              = 74
        category        = 89
      }
      filters {
        id              = 75
        category        = 31
      }
      filters {
        id              = 76
        category        = 41
      }
      filters {
        id              = 77
        category        = 43
      }
      filters {
        id              = 78
        category        = 49
      }
      filters {
        id              = 79 
        category        = 50
      }
      filters {
        id              = 80
        category        = 51
      }
      filters {
        id              = 81
        category        = 52
      }
      filters {
        id              = 82
        category        = 53
      }
      filters {
        id              = 83
        category        = 56
      }
      filters {
        id              = 84
        category        = 81
      }
      filters {
        id              = 85
        category        = 84
      }
      filters {
        id              = 86
        category        = 92
      }
      filters {
        id              = 87
        category        = 93
      }
      filters {
        id              = 88
        category        = 94
      }
      filters {
        id              = 89
        category        = 95
      }
      filters {
        id              = 90
        category        = 97
      }
      filters {
        id              = 91
      }      
    }
}