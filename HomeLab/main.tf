terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.78.2"
    }
  }

  backend "s3" {
    bucket       = "mbc-homelab-state"
    key          = "global/s3/terraform.tfstate"
    region       = "us-west-1"
    use_lockfile = true
    encrypt      = true
  }
}

provider "proxmox" {
  endpoint  = var.endpoint
  api_token = var.api_token
  insecure  = false # set to true if TLS isn't set up
  tmp_dir   = "/var/tmp"

  ssh {
    agent       = true
    username    = "root"
    private_key = file("~/.ssh/proxmox")
  }
}
