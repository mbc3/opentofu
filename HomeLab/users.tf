resource "proxmox_virtual_environment_user" "mbc" {

  comment    = "MBC"
  email      = "cohen@matthewbriancohen.com"
  first_name = "Matt"
  last_name  = "Cohen"
  password   = random_password.mbc_account_password.result
  user_id    = "mbc@pve"
  groups     = ["INFRA"]
}


resource "proxmox_virtual_environment_user" "iphone" {

  comment  = "iPhone User"
  password = random_password.iphone_account_password.result
  user_id  = "iphone@pve"
  groups   = ["MON", "VM"]
}


resource "proxmox_virtual_environment_user" "ansible" {

  comment  = "Ansible User"
  password = random_password.ansible_account_password.result
  user_id  = "ansible@pve"
  groups   = ["MON"]
}

resource "proxmox_virtual_environment_user" "exporter" {

  comment  = "PVE Exporter User"
  password = random_password.ansible_account_password.result
  user_id  = "exporter@pve"
  groups   = ["MON"]
}

###################
# Account Passwords
###################

resource "random_password" "ansible_account_password" {
  length           = 24
  override_special = "_%@"
  special          = true
}

resource "random_password" "iphone_account_password" {
  length           = 24
  override_special = "_%@"
  special          = true
}

resource "random_password" "mbc_account_password" {
  length           = 24
  override_special = "_%@"
  special          = true
}

resource "random_password" "exporter_account_password" {
  length           = 24
  override_special = "!@#$%&*"
  special          = true
}


###################
# API Tokens
###################

resource "proxmox_virtual_environment_user_token" "exporter_token" {
  comment               = "Exporter"
  token_name            = "exporter"
  user_id               = proxmox_virtual_environment_user.exporter.user_id
  privileges_separation = false
}

resource "proxmox_virtual_environment_user_token" "ansible_token" {
  comment               = "Ansible"
  token_name            = "ansible"
  user_id               = proxmox_virtual_environment_user.ansible.user_id
  privileges_separation = false
}
