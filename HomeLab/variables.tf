variable "role_id" {
  description = "role ID for tofu to authenticate with open bao"
  type        = string
  sensitive   = true
}

variable "secret_id" {
  description = "secret ID for tofu to authenticate with open bao"
  type        = string
  sensitive   = true
}

variable "node_name" {
  description = "Name of the node in Proxmox cluster"
  type        = string
  default     = "services"
}

variable "ssh_key" {
  description = "Public SSH key to insert into containers"
  type        = string
  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIE5jb8Vcw0M2BxH4+LxWWc6oBJxa2VsGxlmOjUUGFVpk mbc@arch"
}

variable "search_domain" {
  description = "Search domain"
  type        = string
  default     = "localdomain"
}

variable "dns_servers" {
  description = "DNS servers for ipv4 and ipv6"
  type        = list(string)
  default     = ["192.168.7.101", "192.168.7.106", "2600:6c50:73f:8273:be24:11ff:fe9f:90c8", "2600:6c50:73f:8273:be24:11ff:fe4e:9518"]
}
