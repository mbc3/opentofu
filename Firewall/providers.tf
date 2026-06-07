provider "opnsense" {
  uri            = vephemeral.vault_kv_secret_v2.homelab_firewall.data["uri"]
  api_key        = ephemeral.vault_kv_secret_v2.homelab_firewall.data["api_key"]
  api_secret     = ephemeral.vault_kv_secret_v2.homelab_firewall.data["api_secret"]
  allow_insecure = true # needed until I put valid tls on login
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
