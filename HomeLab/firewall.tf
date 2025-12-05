resource "proxmox_virtual_environment_cluster_firewall" "datacenter-level" {
  enabled        = true
  ebtables       = true
  input_policy   = "DROP"
  output_policy  = "ACCEPT"
  forward_policy = "ACCEPT"
  log_ratelimit {
    enabled = false
    burst   = 10
    rate    = "5/second"
  }
}

resource "proxmox_virtual_environment_cluster_firewall_security_group" "allow_pxmx" {
  name    = "allow_pxmx"
  comment = "Required rules for Proxmox"

  rule {
    type    = "in"
    action  = "ACCEPT"
    comment = "Allow pxmx web interface"
    dport   = "443,8006"
    proto   = "tcp"
    log     = "nolog"
  }
  rule {
    type    = "in"
    action  = "ACCEPT"
    comment = "Allow SSH"
    dport   = "22"
    proto   = "tcp"
    log     = "info"
  }
  rule {
    type    = "in"
    action  = "ACCEPT"
    comment = "Allow corosync"
    dport   = "5405:5412"
    proto   = "udp"
    log     = "nolog"
  }
  rule {
    type    = "in"
    action  = "ACCEPT"
    comment = "Allow vnc"
    dport   = "5900:5999"
    proto   = "tcp"
    log     = "nolog"
  }
  rule {
    type    = "in"
    action  = "ACCEPT"
    comment = "Allow rpcbind"
    dport   = "111"
    proto   = "udp"
    log     = "info"
  }
  rule {
    type    = "out"
    action  = "ACCEPT"
    comment = "Allow sendmail"
    dport   = "25"
    proto   = "tcp"
    log     = "info"
  }
  rule {
    type    = "in"
    action  = "ACCEPT"
    comment = "Allow live migration"
    dport   = "60000:60050"
    proto   = "tcp"
    log     = "info"
  }
  rule {
    type    = "in"
    action  = "ACCEPT"
    comment = "Allow ping"
    proto   = "icmp"
    log     = "nolog"
  }
  rule {
    type    = "in"
    action  = "ACCEPT"
    comment = "Allow ping ipv6"
    proto   = "ipv6-icmp"
    log     = "nolog"
  }
}

resource "proxmox_virtual_environment_cluster_firewall_security_group" "allow_tailscale" {
  name    = "allow_tailscale"
  comment = "Required rules for Tailscale"

  rule {
    type    = "in"
    action  = "ACCEPT"
    comment = "Allow tailscale udp port"
    dport   = "41641"
    proto   = "udp"
    log     = "info"
  }

  rule {
    type    = "in"
    action  = "ACCEPT"
    comment = "Allow http/https"
    dport   = "80,443"
    proto   = "tcp"
    log     = "nolog"
  }
}


resource "proxmox_virtual_environment_cluster_firewall_security_group" "allow_metrics" {
  name    = "allow_metrics"
  comment = "Required rules for scraping metrics for Prometheus"

  rule {
    type    = "in"
    action  = "ACCEPT"
    comment = "Allow prometheus node exporter port"
    dport   = "9100"
    proto   = "tcp"
    log     = "nolog"
  }
}

resource "proxmox_virtual_environment_cluster_firewall_security_group" "block_web" {
  name    = "block_web"
  comment = "Block outbound http/https"

  rule {
    type    = "out"
    action  = "DROP"
    comment = "Drop all outbound http/https traffic"
    dport   = "80,443"
    proto   = "tcp"
    log     = "info"
  }
}

### Alias ##


resource "proxmox_virtual_environment_firewall_ipset" "ipset" {


  name    = "local"
  comment = "Local IPs"

  cidr {
    name    = "192.168.0.0/16"
    comment = "Local Network"
  }

  cidr {
    name    = "100.0.0.0/8"
    comment = "Tailscale"
  }

  cidr {
    name    = "10.10.10.0/24"
    comment = "Wireguard home"
  }


}

resource "proxmox_virtual_environment_firewall_ipset" "ipset_6" {

  name    = "local6"
  comment = "Local IPs IPv6"

  cidr {
    name    = "2600:6c50:77f:af0::/60"
    comment = "Local Network IPv6"
  }

  cidr {
    name    = "2600:6c50:77f:af0f::/64"
    comment = "Wireguard home IPv6"
  }
}

## Firewall Rules ##

resource "proxmox_virtual_environment_firewall_rules" "dc" {
  depends_on = [
    proxmox_virtual_environment_cluster_firewall_security_group.allow_pxmx,
  ]

  rule {
    security_group = proxmox_virtual_environment_cluster_firewall_security_group.allow_pxmx.name
    comment        = "Managed by OpenTofu"
    enabled        = true
  }
  rule {
    security_group = proxmox_virtual_environment_cluster_firewall_security_group.allow_tailscale.name
    comment        = "Managed by OpenTofu"
    enabled        = true
  }
  rule {
    security_group = proxmox_virtual_environment_cluster_firewall_security_group.allow_metrics.name
    comment        = "Managed by OpenTofu"
    enabled        = true
  }
}
