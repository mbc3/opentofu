resource "proxmox_virtual_environment_vm" "files_vm" {
  name        = "files"
  description = "File Server"
  tags        = ["files"]

  node_name = var.node_name
  vm_id     = 104

  agent {
    # read 'Qemu guest agent' section, change to true only when ready
    enabled = false
  }
  # if agent is not enabled, the VM may not be able to shutdown properly, and may need to be forced off
  stop_on_destroy = true

  startup {
    order      = "3"
    up_delay   = "10"
    down_delay = "10"
  }

  cpu {
    cores = 2
    type  = "x86-64-v2-AES" # recommended for modern CPUs
  }

  cdrom {
    file_id = "local:iso/AlmaLinux-9.5-x86_64-minimal.iso"
  }

  memory {
    dedicated = 2048
    floating  = 2048 # set equal to dedicated to enable ballooning
  }

  disk {
    datastore_id = "local-lvm"
    interface    = "scsi0"
    size         = "20"
    ssd          = "true"
    discard      = "on"
    backup       = "true"
    file_format  = "raw"
  }

  initialization {
    ip_config {
      ipv4 {
        address = "192.168.7.104/24"
        gateway = "192.168.7.1"
      }
      ipv6 {
        address = "auto"
      }
    }
  }

  network_device {
    bridge = "vmbr0"
  }

  operating_system {
    type = "l26"
  }
}
