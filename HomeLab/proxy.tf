resource "proxmox_virtual_environment_container" "proxy_container" {
  description = "Squid Container"

  #node_name    = data.vault_kv_secret_v2.homelab_tofu.data["node_name"]
  node_name    = var.node_name
  vm_id        = 116
  unprivileged = "true"
  tags         = ["proxy"]

  initialization {
    hostname = "proxy"

    ip_config {
      ipv4 {
        address = "192.168.7.116/24"
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
      password = random_password.proxy_container_password.result
      keys     = [var.ssh_key]
    }
  }

  cpu {
    cores = "2"
    units = "100" # this is priority of cpu
  }

  memory {
    dedicated = "512"
    swap      = "1024"
  }

  disk {
    datastore_id = "local-zfs"
    size         = "8"
  }

  network_interface {
    name     = "eth0"
    firewall = "true"
  }

  operating_system {
    template_file_id = "local:vztmpl/almalinux-10-default_20250930_amd64.tar.xz"
    type             = "centos"
  }

  features {
    nesting = "true" # strangely in deb 13 nesting needs to be enabled for the console to work
  }

  startup {
    order    = "6"
    up_delay = "2"
  }
}

resource "random_password" "proxy_container_password" {
  length           = 16
  override_special = "_%@"
  special          = true
}
