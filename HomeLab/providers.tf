provider "proxmox" {
  # endpoint = var.endpoint
  # api_token = var.api_token
  endpoint  = data.vault_kv_secret_v2.homelab_tofu.data["endpoint"]
  api_token = data.vault_kv_secret_v2.homelab_tofu.data["api_token"]
  insecure  = false # set to true if TLS isn't set up
  tmp_dir   = "/var/tmp"

  ssh {
    agent       = true
    username    = "root"
    private_key = data.vault_kv_secret_v2.homelab_tofu.data["private_ssh_key"]
    #private_key = file("~/.ssh/proxmox")
  }
}

provider "vault" {
  address = "https://bao.openbao.localdomain"
  auth_login {
    path = "auth/approle/login"

    parameters = {
      role_id   = var.role_id
      secret_id = var.secret_id
    }
  }
}
