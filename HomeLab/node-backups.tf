resource "proxmox_backup_job" "proto_backup" {
  id                = "backup-08002a9e-7d41"
  comment           = "proto storage main backup"
  prune_backups     = { keep-last = 6 }
  schedule          = "mon,wed,fri 05:20"
  storage           = "proto"
  fleecing          = { enabled = true, storage = "local-zfs" }
  all               = true
  mode              = "snapshot"
  compress          = "zstd"
  notes_template    = "{{guestname}}"
  notification_mode = "notification-system"
}

resource "proxmox_backup_job" "spare_backup" {
  id                = "backup-4e8a5267-3e44"
  comment           = "spare storage extra backup"
  prune_backups     = { keep-last = 2 }
  schedule          = "sat 08:15"
  storage           = "spare"
  fleecing          = { enabled = true, storage = "local-zfs" }
  all               = true
  mode              = "snapshot"
  compress          = "zstd"
  notes_template    = "{{guestname}}"
  notification_mode = "notification-system"
}
