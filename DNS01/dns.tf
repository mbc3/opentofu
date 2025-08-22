resource "pihole_dns_record" "services" {
  domain = "services.localdomain"
  ip     = "192.168.7.20"
}

resource "pihole_dns_record" "arch" {
  domain = "arch.internal"
  ip     = "192.168.5.100"
}

resource "pihole_dns_record" "mediapi" {
  domain = "mediapi.localdomain"
  ip     = "192.168.3.60"
}
resource "pihole_dns_record" "dns01" {
  domain = "dns01.localdomain"
  ip     = "192.168.7.101"
}

resource "pihole_dns_record" "logs" {
  domain = "logs.localdomain"
  ip     = "192.168.7.102"
}

resource "pihole_dns_record" "graphs" {
  domain = "graphs.localdomain"
  ip     = "192.168.7.103"
}

resource "pihole_dns_record" "files" {
  domain = "files.localdomain"
  ip     = "192.168.7.104"
}

resource "pihole_dns_record" "freeipa" {
  domain = "freeipa.localdomain"
  ip     = "192.168.7.105"
}

resource "pihole_dns_record" "dns02" {
  domain = "dns02.localdomain"
  ip     = "192.168.7.106"
}

resource "pihole_dns_record" "ca" {
  domain = "ca.localdomain"
  ip     = "192.168.7.107"
}

resource "pihole_dns_record" "semaphore" {
  domain = "semaphore.localdomain"
  ip     = "192.168.7.108"
}

resource "pihole_dns_record" "uptime" {
  domain = "uptime.localdomain"
  ip     = "192.168.7.109"
}

resource "pihole_dns_record" "openbao" {
  domain = "openbao.localdomain"
  ip     = "192.168.7.110"
}

resource "pihole_dns_record" "wazuh" {
  domain = "wazuh.localdomain"
  ip     = "192.168.7.111"
}

resource "pihole_dns_record" "netboot" {
  domain = "netboot.localdomain"
  ip     = "192.168.7.113"
}

resource "pihole_dns_record" "netbox" {
  domain = "netbox.localdomain"
  ip     = "192.168.7.114"
}
