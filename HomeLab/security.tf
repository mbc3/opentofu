resource "proxmox_virtual_environment_vm" "wazuh_vm" {
  name        = "wazuh"
  description = "Wazuh Server"
  tags        = ["security"]

  #node_name = data.vault_kv_secret_v2.homelab_tofu.data["node_name"]
  node_name = var.node_name
  vm_id     = 111

  agent {
    enabled = true
  }
  # if agent is not enabled, the VM may not be able to shutdown properly, and may need to be forced off
  stop_on_destroy = true

  startup {
    order    = "5"
    up_delay = "5"
  }

  cpu {
    cores = 4
    type  = "host"
    units = "100"
  }

  boot_order = ["scsi0", "net0"]

  memory {
    dedicated = 8192
    floating  = 8192 # set equal to dedicated to enable ballooning
  }

  # boot disk
  disk {
    datastore_id = "local-zfs"
    interface    = "scsi0"
    size         = "50"
    ssd          = "true"
    discard      = "on"
    backup       = "true"
  }

  network_device {
    bridge = "vmbr0"
  }

  operating_system {
    type = "l26"
  }

  serial_device {}
}
