variable "api_token" {
  description = "API token and username for proxmox host"
  type        = string
  sensitive   = true
}

variable "endpoint" {
  description = "Endpoint for Proxmox host"
  type        = string
}

variable "node_name" {
  description = "Name of the node in Proxmox cluster"
  type        = string
}

variable "ssh_key" {
  description = "Public SSH key to insert into containers"
  type        = string
}

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
    agent    = true
    username = "opentofu"
  }
}

resource "proxmox_virtual_environment_container" "logs_container" {
  description = "Logs Container"

  node_name = var.node_name
  vm_id     = 101

  initialization {
    hostname = "logs"

    ip_config {
      ipv4 {
        address = "dhcp"
      }
      ipv6 {
        address = "auto"
      }
    }

    user_account {
      password = random_password.logs_container_password.result
      keys     = [var.ssh_key]
    }
  }

  cpu {
    cores = "1"
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
    template_file_id = "local:vztmpl/almalinux-9-default_20221108_amd64.tar.xz"
    type             = "centos"
  }

}

resource "proxmox_virtual_environment_container" "loki_container" {
  description = "Loki Container"

  node_name = var.node_name
  vm_id     = 102

  initialization {
    hostname = "loki"

    ip_config {
      ipv4 {
        address = "dhcp"
      }
      ipv6 {
        address = "auto"
      }
    }

    user_account {
      password = random_password.loki_container_password.result
      keys     = [var.ssh_key]
    }
  }

  cpu {
    cores = "1"
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
    template_file_id = "local:vztmpl/centos-9-stream-default_20221109_amd64.tar.xz"
    type             = "centos"
  }

}

resource "random_password" "loki_container_password" {
  length           = 16
  override_special = "_%@"
  special          = true
}

output "loki_container_password" {
  value     = random_password.loki_container_password.result
  sensitive = true
}

resource "random_password" "logs_container_password" {
  length           = 16
  override_special = "_%@"
  special          = true
}

output "logs_container_password" {
  value     = random_password.logs_container_password.result
  sensitive = true
}
