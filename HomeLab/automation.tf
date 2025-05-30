resource "proxmox_virtual_environment_vm" "semaphore_vm" {
  name        = "semaphore"
  description = "Semaphore Server"
  tags        = ["automation"]

  node_name = var.node_name
  vm_id     = 108

  agent {
    enabled = true
  }
  # if agent is not enabled, the VM may not be able to shutdown properly, and may need to be forced off
  stop_on_destroy = true

  startup {
    order    = "3"
    up_delay = "5"
  }

  cpu {
    cores = 4
    type  = "host"
    units = "100"
  }

  boot_order = ["scsi0", "ide3", "net0"]

  cdrom {
    file_id = "local:iso/AlmaLinux-10.0-x86_64-minimal.iso"
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

  network_device {
    bridge = "vmbr0"
  }

  operating_system {
    type = "l26"
  }
}
