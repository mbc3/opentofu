module "self_hosted_vm" {
  source         = "./modules/vm"
  vm_name        = "hosted"
  vm_description = "Self Hosted Server"
  vm_tags        = ["applications"]
  vm_id          = 115
  disks = [{
    interface = "scsi0"
    size      = "20"
    backup    = "true"
  }]
  cpus             = 2
  ram              = 2048
  pxe_boot         = false
  uefi_boot        = true
  vm_startup_order = "6"
  vm_startup_delay = "3"
}


moved {
  from = proxmox_virtual_environment_vm.self_hosted_vm
  to   = module.self_hosted_vm.proxmox_virtual_environment_vm.vm
}
