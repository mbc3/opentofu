provider "opnsense" {
  uri            = var.uri
  api_key        = ephemeral.vault_kv_secret_v2.homelab_firewall.data["api_key"]
  api_secret     = ephemeral.vault_kv_secret_v2.homelab_firewall.data["api_secret"]
  allow_insecure = false # set to true if TLS isn't set up
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
