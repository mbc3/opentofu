resource "proxmox_virtual_environment_container" "dns01_container" {
  description = "DNS01 Container"

  node_name    = var.node_name
  vm_id        = 101
  unprivileged = "true"
  tags         = ["dns"]

  initialization {
    hostname = "dns01"

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
      password = random_password.dns01_container_password.result
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

  startup {
    order = "1"
  }

  features {
    nesting = "true"
  }

}

resource "random_password" "dns01_container_password" {
  length           = 16
  override_special = "_%@"
  special          = true
}


resource "proxmox_virtual_environment_container" "dns02_container" {
  description = "DNS02 Container"

  node_name    = var.node_name
  vm_id        = 106
  unprivileged = "true"
  tags         = ["dns"]

  initialization {
    hostname = "dns02"

    ip_config {
      ipv4 {
        address = "192.168.7.106/24"
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
      password = random_password.dns02_container_password.result
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

  startup {
    order = "1"
  }

  features {
    nesting = "true"
  }

}

resource "random_password" "dns02_container_password" {
  length           = 16
  override_special = "_%@"
  special          = true
}
