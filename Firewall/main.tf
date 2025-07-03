terraform {
  required_providers {
    opnsense = {
      source  = "browningluke/opnsense"
      version = "0.11.0"
    }
  }

  backend "s3" {
    bucket       = "mbc-homelab-state"
    key          = "global/s3/opnsense.tfstate"
    region       = "us-west-1"
    use_lockfile = true
    encrypt      = true
  }
}

provider "opnsense" {
  uri            = var.uri
  api_key        = var.api_key
  api_secret     = var.api_secret
  allow_insecure = true # needed until I put valid tls on login
}
