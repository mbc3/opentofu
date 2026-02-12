
output "lxc_password" {
  value     = random_password.lxc_password.result
  sensitive = true
}
