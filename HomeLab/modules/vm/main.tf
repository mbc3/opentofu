terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.95"
    }
  }
}

resource "proxmox_virtual_environment_vm" "vm" {
  name        = var.vm_name
  description = var.vm_description
  tags        = var.vm_tags

  node_name = var.node_name
  vm_id     = var.vm_id

  delete_unreferenced_disks_on_destroy = true
  purge_on_destroy                     = true

  agent {
    enabled = true
  }
  stop_on_destroy = true

  startup {
    order    = var.vm_startup_order
    up_delay = var.vm_startup_delay
  }

  cpu {
    cores = var.cpus
    type  = "host"
    units = "100"
  }

  memory {
    dedicated = var.ram
    floating  = var.ram # set equal to enable ballooning
  }

  boot_order = var.pxe_boot ? ["net0", "scsi0"] : ["scsi0", "net0"]
  bios       = var.uefi_boot ? "ovmf" : "seabios"

  scsi_hardware = "virtio-scsi-single"

  dynamic "disk" {
    for_each = var.disks
    content {
      datastore_id = "local-zfs"
      interface    = disk.value["interface"]
      size         = disk.value["size"]
      ssd          = "true"
      discard      = "on"
      backup       = disk.value["backup"]
      iothread     = "true"
    }
  }

  # only need these if uefi_boot is enabled

  dynamic "efi_disk" {
    for_each = var.uefi_boot ? ["placeholder"] : []
    content {
      datastore_id      = "local-zfs"
      file_format       = "raw"
      type              = "4m"
      pre_enrolled_keys = false
    }
  }

  dynamic "rng" {
    for_each = var.uefi_boot ? ["placeholder"] : []
    content {
      source = "/dev/urandom"
    }
  }

  # end

  network_device {
    bridge = "vmbr0"
  }

  operating_system {
    type = "l26"
  }

  serial_device {}
}
