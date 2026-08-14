resource "proxmox_virtual_environment_vm" "talos-control" {
  name                                 = "k8s-controller"
  description                          = "K8s Control Node"
  tags                                 = ["k8s"]
  node_name                            = "services"
  vm_id                                = 150
  delete_unreferenced_disks_on_destroy = true
  purge_on_destroy                     = true

  agent {
    enabled = true
  }
  stop_on_destroy = true

  cpu {
    cores = 4
    type  = "host"
    units = "100"
  }

  memory {
    dedicated = 2048
  }

  started       = false
  boot_order    = ["scsi0", "ide0", "net0"]
  bios          = "ovmf"
  machine       = "q35"
  scsi_hardware = "virtio-scsi-pci"

  cdrom {
    file_id   = "local:iso/talos_nocloud-amd64.iso"
    interface = "ide0"
  }

  disk {
    datastore_id = "local-zfs"
    interface    = "scsi0"
    file_format  = "raw"
    size         = "20"
    ssd          = "true"
    cache        = "writethrough"
    discard      = "on"
    backup       = "true"
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

resource "proxmox_virtual_environment_vm" "talos-worker" {
  name                                 = "k8s-worker"
  description                          = "K8s Worker Node"
  tags                                 = ["k8s"]
  node_name                            = "services"
  vm_id                                = 151
  delete_unreferenced_disks_on_destroy = true
  purge_on_destroy                     = true

  agent {
    enabled = true
  }
  stop_on_destroy = true

  cpu {
    cores = 2
    type  = "host"
    units = "100"
  }

  memory {
    dedicated = 2048
  }

  started       = false
  boot_order    = ["scsi0", "ide0", "net0"]
  bios          = "ovmf"
  machine       = "q35"
  scsi_hardware = "virtio-scsi-pci"

  cdrom {
    file_id   = "local:iso/talos_nocloud-amd64.iso"
    interface = "ide0"
  }

  disk {
    datastore_id = "local-zfs"
    interface    = "scsi0"
    file_format  = "raw"
    size         = "20"
    ssd          = "true"
    cache        = "writethrough"
    discard      = "on"
    backup       = "true"
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
