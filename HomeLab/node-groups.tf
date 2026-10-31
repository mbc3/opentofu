resource "proxmox_virtual_environment_group" "mon" {
  comment  = "Monitoring"
  group_id = "mon"
}

resource "proxmox_virtual_environment_group" "infra" {
  comment  = "Infrastructure Accounts"
  group_id = "infra"
}

resource "proxmox_virtual_environment_group" "vm" {
  comment  = "Accounts with VM access"
  group_id = "vm"
}
