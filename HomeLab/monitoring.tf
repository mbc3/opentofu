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
    dedicated = "512"
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
    template_file_id = "local:vztmpl/debian-13-standard_13.1-2_amd64.tar.zst"
    type             = "debian"
  }

  startup {
    order    = "1"
    up_delay = "3"
  }

}

resource "proxmox_virtual_environment_container" "uptime_container" {
  description = "Uptime Kuma Container"

  #node_name    = data.vault_kv_secret_v2.homelab_tofu.data["node_name"]
  node_name    = var.node_name
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
    template_file_id = "local:vztmpl/debian-13-standard_13.1-2_amd64.tar.zst"
    type             = "debian"
  }

  startup {
    order    = "3"
    up_delay = "3"
  }

  features {
    nesting = "true"
  }
}

resource "proxmox_virtual_environment_vm" "graphs_vm" {
  name        = "graphs"
  description = "Graphs Server"
  tags        = ["monitoring"]

  node_name = var.node_name
  vm_id     = 103

  delete_unreferenced_disks_on_destroy = true
  purge_on_destroy                     = true

  agent {
    enabled = true
  }
  # if agent is not enabled, the VM may not be able to shutdown properly, and may need to be forced off
  stop_on_destroy = true

  startup {
    order    = "1"
    up_delay = "3"
  }

  cpu {
    cores = 2
    type  = "host"
    units = "100"
  }

  memory {
    dedicated = 2048
    floating  = 2048 # set equal to dedicated to enable ballooning
  }

  boot_order = ["scsi0", "net0"]
  bios       = "ovmf"

  # boot disk
  scsi_hardware = "virtio-scsi-single"
  disk {
    datastore_id = "local-zfs"
    interface    = "scsi0"
    size         = "20"
    ssd          = "true"
    discard      = "on"
    backup       = "true"
    iothread     = "true"
  }

  efi_disk {
    datastore_id      = "local-zfs"
    file_format       = "raw"
    type              = "4m"
    pre_enrolled_keys = false
  }

  rng {
    source = "/dev/urandom"
  }

  network_device {
    bridge = "vmbr0"
  }

  operating_system {
    type = "l26"
  }

  serial_device {}
}


resource "random_password" "logs_container_password" {
  length           = 16
  override_special = "_%@"
  special          = true
}

resource "random_password" "uptime_container_password" {
  length           = 16
  override_special = "_%@"
  special          = true
}
