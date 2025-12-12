resource "proxmox_virtual_environment_vm" "template_vm" {
  name        = "template"
  description = "Template Server"
  tags        = ["test"]

  #node_name = data.vault_kv_secret_v2.homelab_tofu.data["node_name"]
  node_name = var.node_name
  vm_id     = 999

  delete_unreferenced_disks_on_destroy = true
  purge_on_destroy                     = true

  agent {
    enabled = true
  }
  # if agent is not enabled, the VM may not be able to shutdown properly, and may need to be forced off
  stop_on_destroy = true

  cpu {
    cores = 2
    type  = "host"
    units = "100"
  }

  bios = "ovmf"

  efi_disk {
    datastore_id      = "local-zfs"
    file_format       = "raw"
    type              = "4m"
    pre_enrolled_keys = false
  }

  rng {
    source = "/dev/urandom"

  }

  boot_order = ["net0", "scsi0"]
  on_boot    = false

  memory {
    dedicated = 2048
    floating  = 2048 # set equal to dedicated to enable ballooning
  }

  # boot disk
  scsi_hardware = "virtio-scsi-single"
  disk {
    datastore_id = "local-zfs"
    interface    = "scsi0"
    size         = "20"
    ssd          = "true"
    discard      = "on"
    backup       = "true"
    file_format  = "raw"
    iothread     = "true"
  }


  network_device {
    bridge = "vmbr0"
  }

  operating_system {
    type = "l26"
  }


  # set true to start after creation
  started  = false
  template = true
}
