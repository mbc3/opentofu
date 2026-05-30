# mount is the root path of the secrets store
# name is the full path of the secret


ephemeral "vault_kv_secret_v2" "homelab_tofu" {
  mount = "kv"
  name  = "homelab/tofu"
}
