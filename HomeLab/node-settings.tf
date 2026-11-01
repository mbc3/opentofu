resource "proxmox_virtual_environment_dns" "node_dns_configuration" {
  domain    = data.proxmox_virtual_environment_dns.services.domain
  node_name = data.proxmox_virtual_environment_dns.services.node_name

  servers = var.node_dns_servers
}

resource "proxmox_network_linux_bridge" "vmbr0" {

  node_name  = "services"
  name       = "vmbr0"
  comment    = "default interface"
  autostart  = "true"
  vlan_aware = "false"
  gateway    = "192.168.7.1"
  address    = "192.168.7.20/24"

  ports = [
    "enp3s0"
  ]

}

data "proxmox_virtual_environment_dns" "services" {
  node_name = "services"
}
