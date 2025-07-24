resource "proxmox_virtual_environment_download_file" "alma_cloud_init" {
  content_type = "iso"
  datastore_id = "local"
  node_name    = data.vault_kv_secret_v2.homelab_tofu.data["node_name"]
  url          = "https://repo.almalinux.org/almalinux/9/cloud/x86_64/images/AlmaLinux-9-GenericCloud-latest.x86_64.qcow2"
  file_name    = "AlmaLinux-9-GenericCloud-latest.x86_64.img"
  overwrite    = false
}
resource "proxmox_virtual_environment_download_file" "alma10_cloud_init" {
  content_type = "iso"
  datastore_id = "local"
  node_name    = data.vault_kv_secret_v2.homelab_tofu.data["node_name"]
  url          = "https://repo.almalinux.org/almalinux/10/cloud/x86_64_v2/images/AlmaLinux-10-GenericCloud-latest.x86_64_v2.qcow2"
  file_name    = "AlmaLinux-10-GenericCloud-latest.x86_64_v2.img"
  overwrite    = false
}
