resource "proxmox_virtual_environment_container" "logs_container" {
  description = "Logs Container"

  node_name    = var.node_name
  vm_id        = 102
  unprivileged = "true"
  tags         = ["monitoring"]


  initialization {
    hostname = "logs"

    ip_config {
      ipv4 {
        address = "192.168.7.102/24"
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
      password = random_password.logs_container_password.result
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

  startup {
    order    = "1"
    up_delay = "3"
  }

}

resource "proxmox_virtual_environment_container" "graphs_container" {
  description = "Graphs Container"

  node_name    = data.vault_kv_secret_v2.homelab_tofu.data["node_name"]
  vm_id        = 103
  unprivileged = "true"
  tags         = ["monitoring"]

  initialization {
    hostname = "graphs"

    ip_config {
      ipv4 {
        address = "192.168.7.103/24"
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
      password = random_password.graphs_container_password.result
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
    order    = "1"
    up_delay = "3"
  }

  features {
    nesting = "true"
  }

}


resource "proxmox_virtual_environment_container" "uptime_container" {
  description = "Uptime Kuma Container"

  node_name    = data.vault_kv_secret_v2.homelab_tofu.data["node_name"]
  vm_id        = 109
  unprivileged = "true"
  tags         = ["monitoring"]

  initialization {
    hostname = "uptime"

    ip_config {
      ipv4 {
        address = "192.168.7.109/24"
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
      password = random_password.uptime_container_password.result
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
    order    = "3"
    up_delay = "3"
  }

  features {
    nesting = "true"
  }
}

resource "random_password" "logs_container_password" {
  length           = 16
  override_special = "_%@"
  special          = true
}

resource "random_password" "graphs_container_password" {
  length           = 16
  override_special = "_%@"
  special          = true
}

resource "random_password" "uptime_container_password" {
  length           = 16
  override_special = "_%@"
  special          = true
}
