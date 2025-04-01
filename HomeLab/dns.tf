resource "proxmox_virtual_environment_container" "dns_container" {
  description = "DNS Container"

  node_name    = var.node_name
  vm_id        = 101
  unprivileged = "true"

  initialization {
    hostname = "dns"

    ip_config {
      ipv4 {
        address = "192.168.7.101/24"
        gateway = "192.168.7.1"
      }
      ipv6 {
        address = "auto"
      }
    }

    dns {
      domain  = "localdomain"
      servers = ["192.168.7.1", "2600:6c50:73f:8273:2d0:b4ff:fe02:1195"]
    }

    user_account {
      password = random_password.logs_container_password.result
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
    size         = "15"
  }

  network_interface {
    name     = "eth0"
    firewall = "true"
  }

  operating_system {
    template_file_id = "local:vztmpl/debian-12-standard_12.7-1_amd64.tar.zst"
    type             = "debian"
  }

  features {
    nesting = "true"
  }

}

resource "random_password" "dns_container_password" {
  length           = 16
  override_special = "_%@"
  special          = true
}
