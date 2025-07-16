
resource "proxmox_virtual_environment_user" "iphone" {

  comment  = "iPhone User"
  password = random_password.iphone_account_password.result
  user_id  = "iphone@pve"
  groups   = ["MON"]
}


resource "proxmox_virtual_environment_user_token" "iphone_token" {
  comment               = "iPhone User Token"
  expiration_date       = "2030-01-01T22:00:00Z"
  token_name            = "iphone"
  user_id               = proxmox_virtual_environment_user.iphone.user_id
  privileges_separation = false
}


resource "random_password" "iphone_account_password" {
  length           = 24
  override_special = "_%@"
  special          = true
}

resource "proxmox_virtual_environment_user" "ansible" {

  comment  = "Ansible User"
  password = random_password.ansible_account_password.result
  user_id  = "ansible@pve"
  groups   = ["MON"]
}


resource "proxmox_virtual_environment_user_token" "ansible_token" {
  comment               = "Ansible User Token"
  expiration_date       = "2040-09-01T22:00:00Z"
  token_name            = "ansible"
  user_id               = proxmox_virtual_environment_user.ansible.user_id
  privileges_separation = false
}


resource "random_password" "ansible_account_password" {
  length           = 24
  override_special = "_%@"
  special          = true
}
