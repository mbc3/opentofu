module "dns01_lxc" {
  source            = "./modules/lxc"
  lxc_description   = "DNS01 Container"
  lxc_name          = "dns01"
  lxc_tags          = ["dns"]
  lxc_id            = 101
  lxc_unpriv        = true
  lxc_ip            = "192.168.7.101"
  ssh_key           = var.ssh_key
  cpus              = 4
  swap              = 1024
  ram               = 512
  disk_size         = 15
  dns_servers       = ["192.168.7.1", "2600:6c50:73f:8273:2d0:b4ff:fe02:1195"]
  lxc_startup_order = "1"
  lxc_startup_delay = "1"
  lxc_template      = "local:vztmpl/debian-12-standard_12.7-1_amd64.tar.zst"
  is_centos         = false
}

moved {
  from = proxmox_virtual_environment_container.dns01_container
  to   = module.dns01_lxc.proxmox_virtual_environment_container.lxc
}

moved {
  from = random_password.dns01_container_password
  to   = module.dns01_lxc.random_password.lxc_password
}

module "dns02_lxc" {
  source            = "./modules/lxc"
  lxc_description   = "DNS02 Container"
  lxc_name          = "dns02"
  lxc_tags          = ["dns"]
  lxc_id            = 106
  lxc_unpriv        = true
  lxc_ip            = "192.168.7.106"
  ssh_key           = var.ssh_key
  cpus              = 4
  swap              = 1024
  ram               = 512
  disk_size         = 15
  dns_servers       = ["192.168.7.1", "2600:6c50:73f:8273:2d0:b4ff:fe02:1195"]
  lxc_startup_order = "1"
  lxc_startup_delay = "1"
  lxc_template      = "local:vztmpl/debian-12-standard_12.7-1_amd64.tar.zst"
  is_centos         = false
}

moved {
  from = proxmox_virtual_environment_container.dns02_container
  to   = module.dns02_lxc.proxmox_virtual_environment_container.lxc
}

moved {
  from = random_password.dns02_container_password
  to   = module.dns02_lxc.random_password.lxc_password
}
