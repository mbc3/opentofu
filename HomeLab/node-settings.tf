resource "proxmox_virtual_environment_dns" "node_dns_configuration" {
  domain    = data.proxmox_virtual_environment_dns.services.domain
  node_name = data.proxmox_virtual_environment_dns.services.node_name

  servers = var.node_dns_servers
}

data "proxmox_virtual_environment_dns" "services" {
  node_name = "services"
}
