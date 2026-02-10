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



# resource "proxmox_virtual_environment_vm" "files_vm" {
#   name        = "files"
#   description = "File Server"
#   tags        = ["files"]

#   #node_name = data.vault_kv_secret_v2.homelab_tofu.data["node_name"]
#   node_name = var.node_name
#   vm_id     = 104

#   delete_unreferenced_disks_on_destroy = true
#   purge_on_destroy                     = true

#   agent {
#     enabled = true
#   }
#   # if agent is not enabled, the VM may not be able to shutdown properly, and may need to be forced off
#   stop_on_destroy = true

#   startup {
#     order    = "2"
#     up_delay = "3"
#   }

#   cpu {
#     cores = 2
#     type  = "host"
#     units = "100"
#   }

#   memory {
#     dedicated = 4096
#     floating  = 4096 # set equal to dedicated to enable ballooning
#   }

#   boot_order = ["scsi0", "net0"]
#   # bios       = "ovmf"

#   # boot disk
#   scsi_hardware = "virtio-scsi-single"
#   disk {
#     datastore_id = "local-zfs"
#     interface    = "scsi0"
#     size         = "20"
#     ssd          = "true"
#     discard      = "on"
#     backup       = "true"
#     iothread     = "true"
#   }

#   disk {
#     datastore_id = "local-zfs"
#     interface    = "scsi1"
#     size         = "250"
#     file_format  = "raw"
#     ssd          = "true"
#     discard      = "on"
#     backup       = "false" # don't need to back up this disk
#     iothread     = "true"
#   }

#   # efi_disk {
#   #   datastore_id      = "local-zfs"
#   #   file_format       = "raw"
#   #   type              = "4m"
#   #   pre_enrolled_keys = false
#   # }

#   network_device {
#     bridge = "vmbr0"
#   }

#   operating_system {
#     type = "l26"
#   }

#   serial_device {}
# }
