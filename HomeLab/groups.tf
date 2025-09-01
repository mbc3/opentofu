resource "proxmox_virtual_environment_group" "MON" {
  comment  = "Monitoring"
  group_id = "MON"
  acl {
    path      = "/"
    propagate = true
    role_id   = "PVEAuditor"
  }
}

resource "proxmox_virtual_environment_group" "INFRA" {
  comment  = "Infrastructure Accounts"
  group_id = "INFRA"
  acl {
    path      = "/"
    propagate = true
    role_id   = "Administrator"
  }
}

resource "proxmox_virtual_environment_group" "VM" {
  comment  = "accounts with VM access"
  group_id = "VM"
  acl {
    path      = "/"
    propagate = true
    role_id   = "PVEVMAdmin"
  }
}
