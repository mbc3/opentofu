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

variable "uri" {
  description = "URI for OPNSense domain"
  type        = string
  default     = "https://opnsense.localdomain"
}
