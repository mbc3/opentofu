provider "proxmox" {
  endpoint  = ephemeral.vault_kv_secret_v2.homelab_tofu.data["endpoint"]
  api_token = ephemeral.vault_kv_secret_v2.homelab_tofu.data["api_token"]
  insecure  = false # set to true if TLS isn't set up
  tmp_dir   = "/var/tmp"

  ssh {
    agent       = true
    username    = "root"
    private_key = ephemeral.vault_kv_secret_v2.homelab_tofu.data["private_ssh_key"]
  }
}

provider "vault" {
  address = "https://bao.openbao.localdomain"
  # auth_login_userpass {
  #   username = "mbc"
  # }
  auth_login {
    path = "auth/approle/login"
    parameters = {
      role_id   = var.role_id
      secret_id = var.secret_id
    }
  }
}
