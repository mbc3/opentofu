resource "proxmox_virtual_environment_cluster_firewall" "datacenter-level" {
  enabled = false

  ebtables       = false
  input_policy   = "DROP"
  output_policy  = "ACCEPT"
  forward_policy = "ACCEPT"
  log_ratelimit {
    enabled = false
    burst   = 10
    rate    = "5/second"
  }
}

resource "proxmox_virtual_environment_cluster_firewall_security_group" "block_web" {
  name    = "Block Web"
  comment = "Managed by OpenTofu"

  rule {
    type    = "out"
    action  = "DROP"
    comment = "Drop all outbound http/https traffic"
    dport   = "80,443"
    proto   = "tcp"
    log     = "info"
  }
}
