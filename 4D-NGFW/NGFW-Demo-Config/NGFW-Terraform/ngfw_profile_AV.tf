resource "fortios_antivirus_profile" "CORP_AV" {
  name = "CORP_AV"
  http {
    av_scan = "block"
    quarantine = "enable"
  }
  ftp {
    av_scan = "block"
    quarantine = "enable"
  }
  imap {
    av_scan = "block"
    quarantine = "enable"
    executables = "virus"
  }
  smtp {
    av_scan = "block"
    quarantine = "enable"
    executables = "virus"
  }
}