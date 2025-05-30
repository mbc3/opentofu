terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.78.0"
    }
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
