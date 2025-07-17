
data "proxmox_virtual_environment_vms" "auto" {
  tags = ["automation"]

  # filter {
  #   name   = "status"
  #   values = ["stopped"]
  # }
}
