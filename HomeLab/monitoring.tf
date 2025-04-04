terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.73.1"
    }
  }
}

provider "proxmox" {
  endpoint  = var.endpoint
  api_token = var.api_token

  # because self-signed TLS certificate is in use
  insecure = true
  tmp_dir  = "/var/tmp"

  ssh {
    agent       = true
    username    = "root"
    private_key = file("~/.ssh/proxmox")
  }
}

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
      servers = ["192.168.7.101", "2600:6c50:73f:8273:2d0:b4ff:fe02:1195"]
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
    order = "2"
  }

}

resource "proxmox_virtual_environment_container" "graphs_container" {
  description = "Graphs Container"

  node_name    = var.node_name
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
      servers = ["192.168.7.101", "2600:6c50:73f:8273:2d0:b4ff:fe02:1195"]
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
    dedicated = "1024"
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
    order = "3"
  }

  features {
    nesting = "true"
    fuse    = "true"
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
