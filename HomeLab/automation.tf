resource "proxmox_virtual_environment_vm" "netboot_vm" {
  name        = "netboot"
  description = "Netboot PXE Server"
  tags        = ["automation"]

  #node_name = data.vault_kv_secret_v2.homelab_tofu.data["node_name"]
  node_name = var.node_name
  vm_id     = 113

  agent {
    enabled = true
  }
  # if agent is not enabled, the VM may not be able to shutdown properly, and may need to be forced off
  stop_on_destroy = true

  startup {
    order    = "4"
    up_delay = "5"
  }

  cpu {
    cores = 4
    type  = "host"
    units = "100"
  }


  memory {
    dedicated = 2048
    floating  = 2048 # set equal to dedicated to enable ballooning
  }

  boot_order = ["scsi0", "net0"]
  # bios = "ovmf"

  # boot disk
  disk {
    datastore_id = "local-zfs"
    interface    = "scsi0"
    size         = "20"
    ssd          = "true"
    discard      = "on"
    backup       = "true"
  }

  # efi_disk {
  #   datastore_id      = "local-zfs"
  #   file_format       = "raw"
  #   type              = "4m"
  #   pre_enrolled_keys = false
  # }

  network_device {
    bridge = "vmbr0"
  }

  operating_system {
    type = "l26"
  }
}

resource "proxmox_virtual_environment_vm" "netbox_vm" {
  name        = "netbox"
  description = "Netbox Server"
  tags        = ["automation"]

  #node_name = data.vault_kv_secret_v2.homelab_tofu.data["node_name"]
  node_name = var.node_name
  vm_id     = 114

  agent {
    enabled = true
  }
  # if agent is not enabled, the VM may not be able to shutdown properly, and may need to be forced off
  stop_on_destroy = true

  startup {
    order    = "4"
    up_delay = "5"
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
  # bios       = "ovmf"

  # boot disk
  disk {
    datastore_id = "local-zfs"
    interface    = "scsi0"
    size         = "20"
    ssd          = "true"
    discard      = "on"
    backup       = "true"
  }

  # efi_disk {
  #   datastore_id      = "local-zfs"
  #   file_format       = "raw"
  #   type              = "4m"
  #   pre_enrolled_keys = false
  # }

  network_device {
    bridge = "vmbr0"
  }

  operating_system {
    type = "l26"
  }
}

resource "proxmox_virtual_environment_vm" "semaphore_vm" {
  name        = "semaphore"
  description = "Semaphore Server"
  tags        = ["automation"]

  #node_name = data.vault_kv_secret_v2.homelab_tofu.data["node_name"]
  node_name = var.node_name
  vm_id     = 108

  agent {
    enabled = true
  }
  # if agent is not enabled, the VM may not be able to shutdown properly, and may need to be forced off
  stop_on_destroy = true

  startup {
    order    = "3"
    up_delay = "5"
  }

  cpu {
    cores = 4
    type  = "host"
    units = "100"
  }

  memory {
    dedicated = 4096
    floating  = 4096 # set equal to dedicated to enable ballooning
  }

  boot_order = ["scsi0", "net0"]
  # bios       = "ovmf"

  # boot disk
  disk {
    datastore_id = "local-zfs"
    interface    = "scsi0"
    size         = "20"
    ssd          = "true"
    discard      = "on"
    backup       = "true"
  }

  # efi_disk {
  #   datastore_id      = "local-zfs"
  #   file_format       = "raw"
  #   type              = "4m"
  #   pre_enrolled_keys = false
  # }

  network_device {
    bridge = "vmbr0"
  }

  operating_system {
    type = "l26"
  }
}

resource "proxmox_virtual_environment_container" "openbao_container" {
  description = "OpenBao Container"

  #node_name    = data.vault_kv_secret_v2.homelab_tofu.data["node_name"]
  node_name    = var.node_name
  vm_id        = 110
  unprivileged = "true"
  tags         = ["automation"]

  initialization {
    hostname = "openbao"

    ip_config {
      ipv4 {
        address = "192.168.7.110/24"
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
      password = random_password.openbao_container_password.result
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
    order    = "4"
    up_delay = "2"
  }
}

resource "random_password" "openbao_container_password" {
  length           = 16
  override_special = "_%@"
  special          = true
}
