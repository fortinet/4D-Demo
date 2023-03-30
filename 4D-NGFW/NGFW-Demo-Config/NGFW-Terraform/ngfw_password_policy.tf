resource "fortios_system_passwordpolicy" "PW" {
  min_lower_case_letter = 1
  min_upper_case_letter = 1
  min_non_alphanumeric = 1
  min_number = 1
  reuse_password = "disable"
  status = "enable"
}