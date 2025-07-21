data "proxmox_virtual_environment_vms" "auto" {
  tags = ["automation"]

  # filter {
  #   name   = "status"
  #   values = ["stopped"]
  # }
}

data "vault_kv_secret_v2" "homelab_tofu" {
  mount = "kv"
  name  = "homelab/tofu"
}
