variable "node_name" {
  description = "name of proxmox node"
  type        = string
  default     = "services"
}

variable "vm_name" {
  description = "name of virtual machine"
  type        = string
}

variable "vm_description" {
  type = string
}

variable "vm_tags" {
  description = "tags for vm"
  type        = list(string)
}

variable "vm_id" {
  description = "proxmox id for the virtual machine"
  type        = number
}

variable "disks" {
  description = "number/size of disk(s)"
  type = list(object({
    size   = string
    backup = string
  }))
  default = [{
    size = "20"
  backup = "true" }]
}

variable "cpus" {
  description = "number of cpus to give virtual machine"
  type        = number
  default     = 2
}

variable "ram" {
  description = "amount of ram to give virtual machine"
  type        = number
  default     = 2048
}

variable "vm_startup_order" {
  type    = string
  default = "1"
}

variable "vm_startup_delay" {
  type    = string
  default = "3"
}

variable "pxe_boot" {
  description = "whether to pxe boot machine (default is yes)"
  type        = bool
  default     = true
}

variable "uefi_boot" {
  description = "whether to enable uefi (default is yes)"
  type        = bool
  default     = true
}
