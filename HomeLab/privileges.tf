resource "proxmox_acl" "mon_acl" {
  path      = "/"
  propagate = true
  group_id  = proxmox_virtual_environment_group.mon.group_id
  role_id   = "PVEAuditor"
}

resource "proxmox_acl" "infra_acl" {
  path      = "/"
  propagate = true
  group_id  = proxmox_virtual_environment_group.infra.group_id
  role_id   = "Administrator"
}

resource "proxmox_acl" "vm_acl" {
  path      = "/"
  propagate = true
  group_id  = proxmox_virtual_environment_group.vm.group_id
  role_id   = "PVEVMAdmin"
}
