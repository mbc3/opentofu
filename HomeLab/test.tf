resource "proxmox_virtual_environment_vm" "test_vm" {
  name        = "test"
  description = "Test Server"
  tags        = ["test"]

  node_name = data.vault_kv_secret_v2.homelab_tofu.data["node_name"]
  vm_id     = 112

  agent {
    enabled = true
  }
  # if agent is not enabled, the VM may not be able to shutdown properly, and may need to be forced off
  stop_on_destroy = true

  startup {
    order    = "6"
    up_delay = "3"
  }

  cpu {
    cores = 2
    type  = "host"
    units = "100"
  }

  boot_order = ["scsi0", "ide3", "net0"]

  cdrom {
    file_id = "local:iso/AlmaLinux-10.0-x86_64-minimal.iso"
  }

  memory {
    dedicated = 2048
    floating  = 2048 # set equal to dedicated to enable ballooning
  }

  # boot disk
  disk {
    datastore_id = "local-lvm"
    interface    = "scsi0"
    size         = "20"
    ssd          = "true"
    discard      = "on"
    backup       = "true"
    file_format  = "raw"
    file_id      = "local:iso/AlmaLinux-10-GenericCloud-latest.x86_64_v2.img"
  }

  network_device {
    bridge = "vmbr0"
  }

  operating_system {
    type = "l26"
  }


  initialization {
    dns {
      domain  = var.search_domain
      servers = ["192.168.7.101", "192.168.7.106"]
    }
    ip_config {
      ipv4 {
        address = "192.168.7.112/24"
        gateway = "192.168.7.1"
      }
      ipv6 {
        address = "auto"
      }
    }
    user_account {
      keys     = [var.ssh_key]
      username = "ansible"
    }
  }
}
