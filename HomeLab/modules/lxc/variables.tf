variable "node_name" {
  description = "name of proxmox node"
  type        = string
  default     = "services"
}
variable "lxc_name" {
  description = "name of lxc container"
  type        = string
}

variable "lxc_description" {
  type = string
}

variable "lxc_tags" {
  description = "tags for lxc container"
  type        = list(string)
}

variable "lxc_id" {
  description = "proxmox id for the lxc container"
  type        = number
}

variable "disk_size" {
  description = "size of disk on lxc container"
  type        = number
  default     = 8
}

variable "cpus" {
  description = "number of cpus to give lxc container"
  type        = number
  default     = 1
}

variable "ram" {
  description = "amount of ram to give lxc container"
  type        = number
  default     = 512
}

variable "swap" {
  description = "amount of swap space to give lxc container"
  type        = number
  default     = 1024
}

variable "lxc_startup_order" {
  type    = string
  default = "1"
}

variable "lxc_startup_delay" {
  type    = string
  default = "3"
}

variable "lxc_unpriv" {
  description = "whether lxc container should be unprivledged or not (defaults to unprivledged)"
  type        = bool
  default     = true
}

variable "lxc_ip" {
  description = "ip address of lxc container"
  type        = string
}

variable "lxc_template" {
  description = "lxc template"
  type        = string
  default     = "local:vztmpl/almalinux-9-default_20240911_amd64.tar.xz"
}
variable "dns_servers" {
  description = "DNS servers for ipv4 and ipv6"
  type        = list(string)
  default     = ["192.168.7.101", "192.168.7.106", "2600:6c50:73f:8273:be24:11ff:fe9f:90c8", "2600:6c50:73f:8273:be24:11ff:fe4e:9518"]
}

variable "ssh_key" {
  description = "Public SSH key to insert into containers"
  type        = string
}

variable "is_centos" {
  description = "is lxc container centos/rhel based (default true)"
  type        = bool
  default     = true
}
