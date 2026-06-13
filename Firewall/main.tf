terraform {
  required_providers {
    opnsense = {
      source  = "browningluke/opnsense"
      version = "0.23.2"
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
