module "freeipa_vm" {
  source         = "./modules/vm"
  vm_name        = "freeipa"
  vm_description = "FreeIPA Server"
  vm_tags        = ["auth"]
  vm_id          = 105
  disks = [{
    interface = "scsi0"
    size      = "20"
    backup    = "true"
  }]
  cpus             = 2
  ram              = 2048
  pxe_boot         = false
  uefi_boot        = false
  vm_startup_order = "2"
  vm_startup_delay = "3"
}


moved {
  from = proxmox_virtual_environment_vm.freeipa_vm
  to   = module.freeipa_vm.proxmox_virtual_environment_vm.vm
}

resource "proxmox_virtual_environment_container" "ca_container" {
  description = "CA Container"

  #node_name    = data.vault_kv_secret_v2.homelab_tofu.data["node_name"]
  node_name    = var.node_name
  vm_id        = 107
  unprivileged = "true"
  tags         = ["auth"]

  initialization {
    hostname = "ca"

    ip_config {
      ipv4 {
        address = "192.168.7.107/24"
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
      password = random_password.ca_container_password.result
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
    template_file_id = "local:vztmpl/almalinux-9-default_20240911_amd64.tar.xz"
    type             = "centos"
  }
  features {
    nesting = "true" # strangely in deb 13 nesting needs to be enabled for the console to work
  }

  startup {
    order    = "2"
    up_delay = "2"
  }

}

resource "random_password" "ca_container_password" {
  length           = 16
  override_special = "_%@"
  special          = true
}
