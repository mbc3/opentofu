resource "proxmox_storage_zfspool" "local_zfs" {
  id             = "local-zfs"
  zfs_pool       = "rpool/data"
  content        = ["images", "rootdir"]
  thin_provision = true
  blocksize      = "64k" # 64k best for virtual machines, 1MiB for file storage
}

resource "proxmox_storage_directory" "local" {
  id      = "local"
  path    = "/var/lib/vz"
  content = ["iso", "vztmpl"]
  shared  = false
  disable = false
}

resource "proxmox_storage_directory" "proto" {
  id      = "proto"
  path    = "/mnt/proto"
  content = ["backup", "snippets", "import"]
  shared  = false
  disable = false
}

resource "proxmox_storage_directory" "spare" {
  id      = "spare"
  path    = "/mnt/spare"
  content = ["backup", "snippets", "import"]
  shared  = false
  disable = false
}
