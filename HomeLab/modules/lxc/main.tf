terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.95"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.8.1"
    }
  }
}

resource "proxmox_virtual_environment_container" "lxc" {
  description  = var.lxc_description
  node_name    = var.node_name
  vm_id        = var.lxc_id
  unprivileged = var.lxc_unpriv
  tags         = var.lxc_tags

  initialization {
    hostname = var.lxc_name

    ip_config {
      ipv4 {
        address = "${var.lxc_ip}/24"
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
      password = random_password.lxc_password.result
      keys     = [var.ssh_key]
    }
  }

  cpu {
    cores = var.cpus
    units = "100" # this is priority of cpu
  }

  memory {
    dedicated = var.ram
    swap      = var.swap
  }

  disk {
    datastore_id = "local-zfs"
    size         = var.disk_size
  }

  network_interface {
    name     = "eth0"
    firewall = "true"
  }

  operating_system {
    template_file_id = var.lxc_template
    type             = var.is_centos ? "centos" : "debian"
  }
  features {
    nesting = "true"
  }

  startup {
    order    = var.lxc_startup_order
    up_delay = var.lxc_startup_delay
  }

}

resource "random_password" "lxc_password" {
  length           = 16
  override_special = "_%@"
  special          = true
}
