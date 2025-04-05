resource "proxmox_virtual_environment_download_file" "alma_cloud_init" {
  content_type = "iso"
  datastore_id = "local"
  node_name    = var.node_name
  url          = "https://repo.almalinux.org/almalinux/9/cloud/x86_64/images/AlmaLinux-9-GenericCloud-latest.x86_64.qcow2"
  file_name    = "AlmaLinux-9-GenericCloud-latest.x86_64.img"
  overwrite    = false
}
