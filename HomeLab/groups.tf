resource "proxmox_virtual_environment_group" "MON" {
  comment  = "Monitoring"
  group_id = "MON"
  acl {
    path      = "/"
    propagate = true
    role_id   = "PVEAuditor"
  }
}
