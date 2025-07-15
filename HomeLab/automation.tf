# resource "proxmox_virtual_environment_vm" "foreman_vm" {
#   name        = "foreman"
#   description = "Foreman Server"
#   tags        = ["automation"]

#   node_name = var.node_name
#   vm_id     = 113

#   agent {
#     enabled = true
#   }
#   # if agent is not enabled, the VM may not be able to shutdown properly, and may need to be forced off
#   stop_on_destroy = true

#   startup {
#     order    = "4"
#     up_delay = "5"
#   }

#   cpu {
#     cores = 4
#     type  = "host"
#     units = "100"
#   }

#   boot_order = ["scsi0", "ide3", "net0"]

#   cdrom {
#     file_id = "local:iso/AlmaLinux-9.5-x86_64-minimal.iso"
#   }

#   memory {
#     dedicated = 4096
#     floating  = 4096 # set equal to dedicated to enable ballooning
#   }

#   # boot disk
#   disk {
#     datastore_id = "local-lvm"
#     interface    = "scsi0"
#     size         = "20"
#     ssd          = "true"
#     discard      = "on"
#     backup       = "true"
#   }

#   # for repos
#   disk {
#     datastore_id = "proto"
#     interface    = "scsi1"
#     size         = "200"
#     file_format  = "qcow2"
#     ssd          = "true"
#     discard      = "on"
#     backup       = "false"
#   }


#   network_device {
#     bridge = "vmbr0"
#   }

#   operating_system {
#     type = "l26"
#   }
# }

resource "proxmox_virtual_environment_vm" "netboot_vm" {
  name        = "netboot"
  description = "Netboot PXE Server"
  tags        = ["automation"]

  node_name = var.node_name
  vm_id     = 113

  agent {
    enabled = true
  }
  # if agent is not enabled, the VM may not be able to shutdown properly, and may need to be forced off
  stop_on_destroy = true

  startup {
    order    = "4"
    up_delay = "5"
  }

  cpu {
    cores = 4
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

  network_device {
    bridge = "vmbr0"
  }

  operating_system {
    type = "l26"
  }
}



resource "proxmox_virtual_environment_vm" "netbox_vm" {
  name        = "netbox"
  description = "Netbox Server"
  tags        = ["automation"]

  node_name = var.node_name
  vm_id     = 114

  agent {
    enabled = true
  }
  # if agent is not enabled, the VM may not be able to shutdown properly, and may need to be forced off
  stop_on_destroy = true

  startup {
    order    = "4"
    up_delay = "5"
  }

  cpu {
    cores = 2
    type  = "host"
    units = "100"
  }

  boot_order = ["scsi0", "net0", "ide3"]

  cdrom {
    file_id = "local:iso/AlmaLinux-9.5-x86_64-minimal.iso"
  }

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
  }

  network_device {
    bridge = "vmbr0"
  }

  operating_system {
    type = "l26"
  }
}

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

resource "proxmox_virtual_environment_container" "openbao_container" {
  description = "OpenBao Container"

  node_name    = var.node_name
  vm_id        = 110
  unprivileged = "true"
  tags         = ["automation"]

  initialization {
    hostname = "openbao"

    ip_config {
      ipv4 {
        address = "192.168.7.110/24"
        gateway = "192.168.7.1"
      }
      ipv6 {
        address = "auto"
      }
    }

    dns {
      domain  = "localdomain"
      servers = var.dns_servers
    }

    user_account {
      password = random_password.openbao_container_password.result
      keys     = [var.ssh_key]
    }
  }

  cpu {
    cores = "2"
    units = "100" # this is priority of cpu
  }

  memory {
    dedicated = "512"
    swap      = "512"
  }

  disk {
    datastore_id = "local-lvm"
    size         = "8"
  }

  network_interface {
    name     = "eth0"
    firewall = "true"
  }

  operating_system {
    template_file_id = "local:vztmpl/almalinux-9-default_20240911_amd64.tar.xz"
    type             = "centos"
  }

  startup {
    order    = "4"
    up_delay = "2"
  }
}

resource "random_password" "openbao_container_password" {
  length           = 16
  override_special = "_%@"
  special          = true
}
