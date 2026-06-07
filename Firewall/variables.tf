variable "uri" {
  description = "URI for OPNSense domain"
  type        = string
  default     = "https://192.168.5.1"
}

variable "api_key" {
  description = "API Key for user login"
  type        = string
  sensitive   = true
}

variable "api_secret" {
  description = "API Secret for user login"
  type        = string
  sensitive   = true
}

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
