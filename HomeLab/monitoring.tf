resource "proxmox_virtual_environment_vm" "graphs_vm" {
  name        = "graphs"
  description = "Graphs Server"
  tags        = ["monitoring"]

  node_name = var.node_name
  vm_id     = 103

  delete_unreferenced_disks_on_destroy = true
  purge_on_destroy                     = true

  agent {
    enabled = true
  }
  # if agent is not enabled, the VM may not be able to shutdown properly, and may need to be forced off
  stop_on_destroy = true

  startup {
    order    = "1"
    up_delay = "3"
  }

  cpu {
    cores = 2
    type  = "host"
    units = "100"
  }

  memory {
    dedicated = 2048
    floating  = 2048 # set equal to dedicated to enable ballooning
  }

  boot_order = ["scsi0", "net0"]
  bios       = "ovmf"

  # boot disk
  scsi_hardware = "virtio-scsi-single"
  disk {
    datastore_id = "local-zfs"
    interface    = "scsi0"
    size         = "20"
    ssd          = "true"
    discard      = "on"
    backup       = "true"
    iothread     = "true"
  }

  efi_disk {
    datastore_id      = "local-zfs"
    file_format       = "raw"
    type              = "4m"
    pre_enrolled_keys = false
  }

  rng {
    source = "/dev/urandom"
  }

  network_device {
    bridge = "vmbr0"
  }

  operating_system {
    type = "l26"
  }

  serial_device {}
}


resource "proxmox_virtual_environment_vm" "logs_vm" {
  name        = "logs"
  description = "Logs Server"
  tags        = ["monitoring"]

  node_name = var.node_name
  vm_id     = 102

  delete_unreferenced_disks_on_destroy = true
  purge_on_destroy                     = true

  agent {
    enabled = true
  }
  # if agent is not enabled, the VM may not be able to shutdown properly, and may need to be forced off
  stop_on_destroy = true

  startup {
    order    = "1"
    up_delay = "3"
  }

  cpu {
    cores = 2
    type  = "host"
    units = "100"
  }

  memory {
    dedicated = 2048
    floating  = 2048 # set equal to dedicated to enable ballooning
  }

  boot_order = ["scsi0", "net0"]
  bios       = "ovmf"

  # boot disk
  scsi_hardware = "virtio-scsi-single"
  disk {
    datastore_id = "local-zfs"
    interface    = "scsi0"
    size         = "20"
    ssd          = "true"
    discard      = "on"
    backup       = "true"
    iothread     = "true"
  }

  efi_disk {
    datastore_id      = "local-zfs"
    file_format       = "raw"
    type              = "4m"
    pre_enrolled_keys = false
  }

  rng {
    source = "/dev/urandom"
  }

  network_device {
    bridge = "vmbr0"
  }

  operating_system {
    type = "l26"
  }

  serial_device {}
}
