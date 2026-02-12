module "netboot_vm" {
  source         = "./modules/vm"
  vm_name        = "netboot"
  vm_description = "Netboot PXE Server"
  vm_tags        = ["automation"]
  vm_id          = 113
  disks = [{
    interface = "scsi0"
    size      = "20"
    backup    = "true"
  }]
  cpus             = 4
  ram              = 2048
  pxe_boot         = false
  uefi_boot        = false
  vm_startup_order = "4"
  vm_startup_delay = "5"
}


moved {
  from = proxmox_virtual_environment_vm.netboot_vm
  to   = module.netboot_vm.proxmox_virtual_environment_vm.vm
}

module "netbox_vm" {
  source         = "./modules/vm"
  vm_name        = "netbox"
  vm_description = "Netbox Server"
  vm_tags        = ["automation"]
  vm_id          = 114
  disks = [{
    interface = "scsi0"
    size      = "20"
    backup    = "true"
  }]
  cpus             = 2
  ram              = 2048
  pxe_boot         = false
  uefi_boot        = false
  vm_startup_order = "4"
  vm_startup_delay = "5"
}


moved {
  from = proxmox_virtual_environment_vm.netbox_vm
  to   = module.netbox_vm.proxmox_virtual_environment_vm.vm
}

module "semaphore_vm" {
  source         = "./modules/vm"
  vm_name        = "semaphore"
  vm_description = "Semaphore Server"
  vm_tags        = ["automation"]
  vm_id          = 108
  disks = [{
    interface = "scsi0"
    size      = "20"
    backup    = "true"
  }]
  cpus             = 4
  ram              = 4096
  pxe_boot         = false
  uefi_boot        = false
  vm_startup_order = "3"
  vm_startup_delay = "5"
}


moved {
  from = proxmox_virtual_environment_vm.semaphore_vm
  to   = module.semaphore_vm.proxmox_virtual_environment_vm.vm
}

module "openbao_lxc" {
  source            = "./modules/lxc"
  lxc_description   = "OpenBao Container"
  lxc_name          = "openbao"
  lxc_tags          = ["automation"]
  lxc_id            = 110
  lxc_unpriv        = true
  lxc_ip            = "192.168.7.110"
  ssh_key           = var.ssh_key
  cpus              = 2
  swap              = 1024
  ram               = 512
  disk_size         = 8
  lxc_startup_order = "4"
  lxc_startup_delay = "2"
  lxc_template      = "local:vztmpl/almalinux-9-default_20240911_amd64.tar.xz"
  is_centos         = true
}

moved {
  from = proxmox_virtual_environment_container.openbao_container
  to   = module.openbao_lxc.proxmox_virtual_environment_container.lxc
}

moved {
  from = random_password.openbao_container_password
  to   = module.openbao_lxc.random_password.lxc_password
}
