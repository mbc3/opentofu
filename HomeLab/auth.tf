resource "proxmox_virtual_environment_vm" "freeipa_vm" {
  name        = "freeipa"
  description = "FreeIPA Server"
  tags        = ["auth"]

  #node_name = data.vault_kv_secret_v2.homelab_tofu.data["node_name"]
  node_name = var.node_name
  vm_id     = 105

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

  boot_order = ["scsi0", "net0"]

  memory {
    dedicated = 2048
    floating  = 2048 # set equal to dedicated to enable ballooning
  }

  # boot disk
  disk {
    datastore_id = "local-zfs"
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

  serial_device {}
}

resource "proxmox_virtual_environment_container" "ca_container" {
  description = "CA Container"

  #node_name    = data.vault_kv_secret_v2.homelab_tofu.data["node_name"]
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
    dedicated = "2048"
    swap      = "1024"
  }

  disk {
    datastore_id = "local-zfs"
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

  startup {
    order    = "2"
    up_delay = "2"
  }

}

resource "random_password" "ca_container_password" {
  length           = 16
  override_special = "_%@"
  special          = true
}
