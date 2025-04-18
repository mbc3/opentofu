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
    up_delay = "5"
  }

  cpu {
    cores = 2
    type  = "x86-64-v2-AES"
    units = "100"
  }

  # cdrom {
  #   file_id = "local:iso/AlmaLinux-9.5-x86_64-minimal.iso"
  # }

  memory {
    dedicated = 2048
    floating  = 2048 # set equal to dedicated to enable ballooning
  }

  # boot disk
  disk {
    datastore_id = "local-lvm"
    interface    = "scsi0"
    size         = "20"
    ssd          = "true"
    discard      = "on"
    backup       = "true"
    file_id      = proxmox_virtual_environment_download_file.alma_cloud_init.id
  }

  # attached disk
  disk {
    datastore_id = "share"
    interface    = "scsi1"
    size         = "50"
    backup       = "true"
    file_format  = "raw"
  }



  initialization {
    dns {
      domain  = var.search_domain
      servers = var.dns_servers
    }
    ip_config {
      ipv4 {
        address = "192.168.7.104/24"
        gateway = "192.168.7.1"
      }
      ipv6 {
        address = "auto"
      }
    }
    user_account {
      username = "ansible"
      keys     = [var.ssh_key]
    }
  }

  network_device {
    bridge = "vmbr0"
  }

  operating_system {
    type = "l26"
  }
}
