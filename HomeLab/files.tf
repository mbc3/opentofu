resource "proxmox_virtual_environment_vm" "files_vm" {
  name        = "files"
  description = "File Server"
  tags        = ["files"]

  node_name = var.node_name
  vm_id     = 104

  agent {
    enabled = true
  }
  # if agent is not enabled, the VM may not be able to shutdown properly, and may need to be forced off
  stop_on_destroy = true

  startup {
    order    = "2"
    up_delay = "3"
  }

  cpu {
    cores = 2
    type  = "host"
    units = "100"
  }

  boot_order = ["scsi0", "ide3", "net0"]

  cdrom {
    file_id = "local:iso/AlmaLinux-9.5-x86_64-minimal.iso"
  }

  memory {
    dedicated = 4096
    floating  = 4096 # set equal to dedicated to enable ballooning
  }

  # boot disk
  disk {
    datastore_id = "local-lvm"
    interface    = "scsi0"
    size         = "20"
    ssd          = "true"
    discard      = "on"
    backup       = "true"
  }

  disk {
    datastore_id = "share"
    interface    = "scsi1"
    size         = "100"
    file_format  = "qcow2"
    ssd          = "true"
    discard      = "on"
    backup       = "false"
  }

  disk {
    datastore_id = "proto"
    interface    = "scsi2"
    size         = "800"
    file_format  = "qcow2"
    ssd          = "true"
    discard      = "on"
    backup       = "false"
  }

  network_device {
    bridge = "vmbr0"
  }

  operating_system {
    type = "l26"
  }
}
