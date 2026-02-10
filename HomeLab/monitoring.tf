module "graphs_vm" {
  source         = "./modules/vm"
  vm_name        = "graphs"
  vm_description = "Graphs Server"
  vm_tags        = ["monitoring"]
  vm_id          = 103
  disks = [{
    size = "20"
  backup = "true" }]
  cpus             = 2
  ram              = 2048
  pxe_boot         = false
  uefi_boot        = true
  vm_startup_order = "1"
  vm_startup_delay = "3"
}


moved {
  from = proxmox_virtual_environment_vm.graphs_vm
  to   = module.graphs_vm.proxmox_virtual_environment_vm.vm
}

module "logs_vm" {
  source         = "./modules/vm"
  vm_name        = "logs"
  vm_description = "Logs Server"
  vm_tags        = ["monitoring"]
  vm_id          = 102
  disks = [{
    size = "20"
  backup = "true" }]
  cpus             = 2
  ram              = 2048
  pxe_boot         = false
  uefi_boot        = true
  vm_startup_order = "1"
  vm_startup_delay = "3"
}


moved {
  from = proxmox_virtual_environment_vm.logs_vm
  to   = module.logs_vm.proxmox_virtual_environment_vm.vm
}
