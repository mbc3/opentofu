variable "api_token" {
  description = "API token and username for proxmox host"
  type        = string
  sensitive   = true
}

variable "endpoint" {
  description = "Endpoint for Proxmox host"
  type        = string
}

variable "node_name" {
  description = "Name of the node in Proxmox cluster"
  type        = string
}

variable "ssh_key" {
  description = "Public SSH key to insert into containers"
  type        = string
}

variable "search_domain" {
  description = "Search domain"
  type        = string
  default     = "localdomain"
}

variable "dns_servers" {
  description = "DNS servers for ipv4 and ipv6"
  type        = list(string)
  default     = ["192.168.7.101", "192.168.7.106", "2600:6c50:73f:8273:be24:11ff:fe70:1b8c", "2600:6c50:73f:8273:be24:11ff:fe5d:82a1"]
}
