# mount is the root path of the secrets store
# name is the full path of the secret


ephemeral "vault_kv_secret_v2" "homelab_firewall" {
  mount = "kv"
  name  = "homelab/firewall"
}
