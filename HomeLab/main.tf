terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.87"
    }
    #   vault = {
    #     source  = "hashicorp/vault"
    #     version = "~> 5.1.0"
    #   }
  }

  backend "s3" {
    bucket                   = "mbc-homelab-state"
    key                      = "global/s3/services.tfstate"
    region                   = "us-west-1"
    use_lockfile             = true
    encrypt                  = true
    shared_credentials_files = ["~/.aws/credentials", "/home/semaphore/.aws/credentials"]
  }
}
