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
  comment  = "Infrastructure Service Accounts"
  group_id = "INFRA"
  acl {
    path      = "/"
    propagate = true
    role_id   = "PVEVMAdmin"
  }
}
