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
