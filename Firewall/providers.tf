provider "opnsense" {
  uri            = var.uri
  api_key        = var.api_key
  api_secret     = var.api_secret
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
