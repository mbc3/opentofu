module "freeipa01_vm" {
  source         = "./modules/vm"
  vm_name        = "freeipa01"
  vm_description = "FreeIPA 01 Server"
  vm_tags        = ["auth"]
  vm_id          = 105
  disks = [{
    interface = "scsi0"
    size      = "20"
    backup    = "true"
  }]
  cpus             = 2
  ram              = 2048
  pxe_boot         = false
  uefi_boot        = true
  vm_startup_order = "2"
  vm_startup_delay = "3"
}

module "freeipa02_vm" {
  source         = "./modules/vm"
  vm_name        = "freeipa02"
  vm_description = "FreeIPA 02 Server"
  vm_tags        = ["auth"]
  vm_id          = 118
  disks = [{
    interface = "scsi0"
    size      = "20"
    backup    = "true"
  }]
  cpus             = 2
  ram              = 2048
  pxe_boot         = false
  uefi_boot        = true
  vm_startup_order = "2"
  vm_startup_delay = "3"
}

module "authentik_vm" {
  source         = "./modules/vm"
  vm_name        = "authentik"
  vm_description = "Authentik Server"
  vm_tags        = ["auth"]
  vm_id          = 114
  disks = [{
    interface = "scsi0"
    size      = "20"
    backup    = "true"
  }]
  cpus             = 2
  ram              = 2048
  pxe_boot         = false
  uefi_boot        = true
  vm_startup_order = "2"
  vm_startup_delay = "3"
}

module "ca_lxc" {
  source            = "./modules/lxc"
  lxc_description   = "CA Container"
  lxc_name          = "ca"
  lxc_tags          = ["auth"]
  lxc_id            = 107
  lxc_unpriv        = true
  lxc_ip            = "192.168.7.107"
  ssh_key           = var.ssh_key
  cpus              = 2
  swap              = 1024
  ram               = 1024
  disk_size         = 15
  lxc_startup_order = "2"
  lxc_startup_delay = "2"
  lxc_template      = "local:vztmpl/almalinux-9-default_20240911_amd64.tar.xz"
  is_centos         = true
}

# resource "proxmox_virtual_environment_container" "authentik_ldap" {
#   description = "Authentik LDAP"

#   node_name = "authentik-ldap"
#   vm_id     = 100

#   unprivileged = true
#   features {
#     nesting = true
#   }

#   console {
#     enabled = true
#     type = "console"
#     tty_count = 2
#   }

#   initialization {
#     hostname = "autentik-ldap"
#     entrypoint = "/ldap"

#     ip_config {
#       ipv4 {
#         address = "192.168.7.100"
#       }
#     }
#   }

#   disk {
#     datastore_id = "local-lvm"
#     size         = 8
#   }

#   operating_system {
#     template_file_id = "local:ldap_2026.tar"
#     type = "debian"
#   }

#   startup {
#     order      = "3"
#     up_delay   = "60"
#     down_delay = "60"
#   }
# }

# import {
#   to = proxmox_virtual_environment_container.authentik_ldap
#   id = "authentik-ldap/100"
# }
