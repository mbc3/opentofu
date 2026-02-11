module "files_vm" {
  source         = "./modules/vm"
  vm_name        = "files"
  vm_description = "Files Server"
  vm_tags        = ["files"]
  vm_id          = 104
  disks = [{
    interface = "scsi0"
    size      = "20"
    backup    = "true"
    },
    {
      interface = "scsi1"
      size      = "250"
      backup    = "false"
  }]
  cpus             = 2
  ram              = 4096
  pxe_boot         = false
  uefi_boot        = false
  vm_startup_order = "2"
  vm_startup_delay = "3"
}


moved {
  from = proxmox_virtual_environment_vm.files_vm
  to   = module.files_vm.proxmox_virtual_environment_vm.vm
}
