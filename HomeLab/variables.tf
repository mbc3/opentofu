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
