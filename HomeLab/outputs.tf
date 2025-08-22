# Misc

# output "auto" {
#   value = data.proxmox_virtual_environment_vms.auto
# }

# output "homelab_tofu_api_token" {
#   value     = data.vault_kv_secret_v2.homelab_tofu.data["api_token"]
#   sensitive = true
# }

# output "homelab_tofu_endpoint" {
#   value     = data.vault_kv_secret_v2.homelab_tofu.data["endpoint"]
#   sensitive = true
# }

#####################
# Container Passwords
#####################

output "logs_container_password" {
  value     = random_password.logs_container_password.result
  sensitive = true
}

output "graphs_container_password" {
  value     = random_password.graphs_container_password.result
  sensitive = true
}

output "dns01_container_password" {
  value     = random_password.dns01_container_password.result
  sensitive = true
}

output "dns02_container_password" {
  value     = random_password.dns02_container_password.result
  sensitive = true
}

output "ca_container_password" {
  value     = random_password.ca_container_password.result
  sensitive = true
}

output "uptime_container_password" {
  value     = random_password.uptime_container_password.result
  sensitive = true
}

output "openbao_container_password" {
  value     = random_password.openbao_container_password.result
  sensitive = true
}

###################
# Account Passwords
###################

output "iphone_account_password" {
  value     = random_password.iphone_account_password.result
  sensitive = true
}

output "ansible_account_password" {
  value     = random_password.ansible_account_password.result
  sensitive = true
}

output "mbc_account_password" {
  value     = random_password.mbc_account_password.result
  sensitive = true
}

###################
# API Tokens
###################

# output "ansible_token" {
#   value     = proxmox_virtual_environment_user_token.ansible_token
#   sensitive = true
# }
