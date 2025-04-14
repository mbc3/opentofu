resource "proxmox_virtual_environment_vm" "freeipa_vm" {
  name        = "freeipa"
  description = "FreeIPA Server"
  tags        = ["auth"]

  node_name = var.node_name
  vm_id     = 105

  agent {
    enabled = true
  }
  # if agent is not enabled, the VM may not be able to shutdown properly, and may need to be forced off
  stop_on_destroy = true

  startup {
    order    = "2"
    up_delay = "10"
  }

  cpu {
    cores = 2
    type  = "x86-64-v2-AES"
    units = "100"
  }

  boot_order = ["scsi0", "ide3", "net0"]

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
  }

  network_device {
    bridge = "vmbr0"
  }

  operating_system {
    type = "l26"
  }
}

resource "proxmox_virtual_environment_container" "ca_container" {
  description = "CA Container"

  node_name    = var.node_name
  vm_id        = 107
  unprivileged = "true"
  tags         = ["auth"]

  initialization {
    hostname = "ca"

    ip_config {
      ipv4 {
        address = "192.168.7.107/24"
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
      password = random_password.ca_container_password.result
      keys     = [var.ssh_key]
    }
  }

  cpu {
    cores = "2"
    units = "100" # this is priority of cpu
  }

  memory {
    dedicated = "1024"
    swap      = "512"
  }

  disk {
    datastore_id = "local-lvm"
    size         = "15"
  }

  network_interface {
    name     = "eth0"
    firewall = "true"
  }

  operating_system {
    template_file_id = "local:vztmpl/almalinux-9-default_20240911_amd64.tar.xz"
    type             = "centos"
  }

}

resource "random_password" "ca_container_password" {
  length           = 16
  override_special = "_%@"
  special          = true
}
