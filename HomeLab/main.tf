terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = ">= 0.123.1"
    }
    vault = {
      source  = "hashicorp/vault"
      version = "5.13.0"
    }
  }

  backend "s3" {
    bucket       = "mbc-homelab-state"
    key          = "global/s3/services.tfstate"
    region       = "us-west-1"
    use_lockfile = true
    encrypt      = true
  }
}
