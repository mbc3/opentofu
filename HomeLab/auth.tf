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
  pxe_boot         = true
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

moved {
  from = proxmox_virtual_environment_container.ca_container
  to   = module.ca_lxc.proxmox_virtual_environment_container.lxc
}

moved {
  from = random_password.ca_container_password
  to   = module.ca_lxc.random_password.lxc_password
}
