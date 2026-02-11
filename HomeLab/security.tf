module "wazuh_vm" {
  source         = "./modules/vm"
  vm_name        = "wazuh"
  vm_description = "Wazuh Server"
  vm_tags        = ["security"]
  vm_id          = 111
  disks = [{
    interface = "scsi0"
    size      = "50"
    backup    = "true"
  }]
  cpus             = 4
  ram              = 8192
  pxe_boot         = false
  uefi_boot        = false
  vm_startup_order = "5"
  vm_startup_delay = "5"
}


moved {
  from = proxmox_virtual_environment_vm.wazuh_vm
  to   = module.wazuh_vm.proxmox_virtual_environment_vm.vm
}
