terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.78.1"
    }
  }

  backend "s3" {
    bucket = "mbc-homelab-state"
    key    = "global/s3/terraform.tfstate"
    region = "us-west-1"

    dynamodb_table = "mbc-homelab-locks"
    encrypt        = true
  }
}

provider "proxmox" {
  endpoint  = var.endpoint
  api_token = var.api_token

  # because self-signed TLS certificate is in use
  insecure = true
  tmp_dir  = "/var/tmp"

  ssh {
    agent       = true
    username    = "root"
    private_key = file("~/.ssh/proxmox")
  }
}
