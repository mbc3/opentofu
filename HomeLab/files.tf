resource "proxmox_virtual_environment_vm" "files_vm" {
  name        = "files"
  description = "File Server"
  tags        = ["files"]

  #node_name = data.vault_kv_secret_v2.homelab_tofu.data["node_name"]
  node_name = var.node_name
  vm_id     = 104

  agent {
    enabled = true
  }
  # if agent is not enabled, the VM may not be able to shutdown properly, and may need to be forced off
  stop_on_destroy = true

  startup {
    order    = "2"
    up_delay = "3"
  }

  cpu {
    cores = 2
    type  = "host"
    units = "100"
  }

  boot_order = ["scsi0", "net0"]

  memory {
    dedicated = 4096
    floating  = 4096 # set equal to dedicated to enable ballooning
  }

  # boot disk
  disk {
    datastore_id = "local-zfs"
    interface    = "scsi0"
    size         = "20"
    ssd          = "true"
    discard      = "on"
    backup       = "true"
  }

  disk {
    datastore_id = "local-zfs"
    interface    = "scsi1"
    size         = "200"
    file_format  = "raw"
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
}
