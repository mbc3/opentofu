module "proxy_lxc" {
  source            = "./modules/lxc"
  lxc_description   = "Squid Container"
  lxc_name          = "proxy"
  lxc_tags          = ["proxy"]
  lxc_id            = 116
  lxc_unpriv        = true
  lxc_ip            = "192.168.7.116"
  ssh_key           = var.ssh_key
  cpus              = 2
  swap              = 1024
  ram               = 512
  disk_size         = 8
  lxc_startup_order = "6"
  lxc_startup_delay = "2"
  lxc_template      = "local:vztmpl/almalinux-10-default_20250930_amd64.tar.xz"
  is_centos         = true
}

moved {
  from = proxmox_virtual_environment_container.proxy_container
  to   = module.proxy_lxc.proxmox_virtual_environment_container.lxc
}

moved {
  from = random_password.proxy_container_password
  to   = module.proxy_lxc.random_password.lxc_password
}
