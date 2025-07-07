resource "opnsense_unbound_host_override" "arch_4" {
  enabled     = true
  description = "mbc arch desktop ipv4"
  type        = "A"
  hostname    = "arch"
  domain      = "internal"
  server      = "192.168.5.100"
}

resource "opnsense_unbound_host_override" "arch_6" {
  enabled     = true
  description = "mbc arch desktop ipv6"
  type        = "AAAA"
  hostname    = "arch"
  domain      = "internal"
  server      = "2600:6c50:73f:8272:e8d8:9395:90ca:8a84"
}

resource "opnsense_unbound_host_override" "ca_4" {
  enabled     = true
  description = "ca ipv4"
  type        = "A"
  hostname    = "ca"
  domain      = "localdomain"
  server      = "192.168.7.107"
}

resource "opnsense_unbound_host_override" "ca_6" {
  enabled     = true
  description = "ca ipv6"
  type        = "AAAA"
  hostname    = "ca"
  domain      = "localdomain"
  server      = "2600:6c50:73f:8273:be24:11ff:feb8:7a34"
}

resource "opnsense_unbound_host_override" "dns01_4" {
  enabled     = true
  description = "dns01 ipv4"
  type        = "A"
  hostname    = "dns01"
  domain      = "localdomain"
  server      = "192.168.7.101"
}

resource "opnsense_unbound_host_override" "dns01_6" {
  enabled     = true
  description = "dns01 ipv6"
  type        = "AAAA"
  hostname    = "dns01"
  domain      = "localdomain"
  server      = "2600:6c50:73f:8273:be24:11ff:fe9f:90c8"
}

resource "opnsense_unbound_host_override" "dns02_4" {
  enabled     = true
  description = "dns02 ipv4"
  type        = "A"
  hostname    = "dns02"
  domain      = "localdomain"
  server      = "192.168.7.106"
}

resource "opnsense_unbound_host_override" "dns02_6" {
  enabled     = true
  description = "dns02 ipv6"
  type        = "AAAA"
  hostname    = "dns02"
  domain      = "localdomain"
  server      = "2600:6c50:73f:8273:be24:11ff:fe4e:9518"
}

resource "opnsense_unbound_host_override" "files_4" {
  enabled     = true
  description = "files ipv4"
  type        = "A"
  hostname    = "files"
  domain      = "localdomain"
  server      = "192.168.7.104"
}

resource "opnsense_unbound_host_override" "files_6" {
  enabled     = true
  description = "files ipv6"
  type        = "AAAA"
  hostname    = "files"
  domain      = "localdomain"
  server      = "2600:6c50:73f:8273:be24:11ff:fe58:7e8d"
}


resource "opnsense_unbound_host_override" "freeipa_4" {
  enabled     = true
  description = "freeipa ipv4"
  type        = "A"
  hostname    = "freeipa"
  domain      = "localdomain"
  server      = "192.168.7.105"
}

resource "opnsense_unbound_host_override" "freeipa_6" {
  enabled     = true
  description = "freeipa ipv6"
  type        = "AAAA"
  hostname    = "freeipa"
  domain      = "localdomain"
  server      = "2600:6c50:73f:8273:be24:11ff:fefa:1ce5"
}

resource "opnsense_unbound_host_override" "graphs_4" {
  enabled     = true
  description = "graphs ipv4"
  type        = "A"
  hostname    = "graphs"
  domain      = "localdomain"
  server      = "192.168.7.103"
}

resource "opnsense_unbound_host_override" "graphs_6" {
  enabled     = true
  description = "graphs ipv6"
  type        = "AAAA"
  hostname    = "graphs"
  domain      = "localdomain"
  server      = "2600:6c50:73f:8273:be24:11ff:fe8e:9cf5"
}

resource "opnsense_unbound_host_override" "logs_4" {
  enabled     = true
  description = "logs ipv4"
  type        = "A"
  hostname    = "logs"
  domain      = "localdomain"
  server      = "192.168.7.102"
}

resource "opnsense_unbound_host_override" "logs_6" {
  enabled     = true
  description = "logs ipv6"
  type        = "AAAA"
  hostname    = "logs"
  domain      = "localdomain"
  server      = "2600:6c50:73f:8273:be24:11ff:fec9:b5df"
}

resource "opnsense_unbound_host_override" "mediapi_4" {
  enabled     = true
  description = "mediapi ipv4"
  type        = "A"
  hostname    = "mediapi"
  domain      = "localdomain"
  server      = "192.168.3.60"
}

resource "opnsense_unbound_host_override" "mediapi_6" {
  enabled     = true
  description = "mediapi ipv6"
  type        = "AAAA"
  hostname    = "mediapi"
  domain      = "localdomain"
  server      = "2600:6c50:73f:8271:f5b0:b18a:216d:c640"
}

resource "opnsense_unbound_host_override" "openbao_4" {
  enabled     = true
  description = "openbao ipv4"
  type        = "A"
  hostname    = "openbao"
  domain      = "localdomain"
  server      = "192.168.7.110"
}

resource "opnsense_unbound_host_override" "openbao_6" {
  enabled     = true
  description = "openbao ipv6"
  type        = "AAAA"
  hostname    = "openbao"
  domain      = "localdomain"
  server      = "2600:6c50:73f:8273:be24:11ff:febe:dbba"
}

resource "opnsense_unbound_host_override" "semaphore_4" {
  enabled     = true
  description = "semaphore ipv4"
  type        = "A"
  hostname    = "semaphore"
  domain      = "localdomain"
  server      = "192.168.7.108"
}

resource "opnsense_unbound_host_override" "semaphore_6" {
  enabled     = true
  description = "semaphore ipv6"
  type        = "AAAA"
  hostname    = "semaphore"
  domain      = "localdomain"
  server      = "2600:6c50:73f:8273:be24:11ff:fe0b:4495"
}

resource "opnsense_unbound_host_override" "test_4" {
  enabled     = true
  description = "test ipv4"
  type        = "A"
  hostname    = "test"
  domain      = "localdomain"
  server      = "192.168.7.112"
}

resource "opnsense_unbound_host_override" "test_6" {
  enabled     = true
  description = "test ipv6"
  type        = "AAAA"
  hostname    = "test"
  domain      = "localdomain"
  server      = "2600:6c50:73f:8273:be24:11ff:fedb:d5b7"
}

resource "opnsense_unbound_host_override" "services_4" {
  enabled     = true
  description = "services proxmox ipv4"
  type        = "A"
  hostname    = "services"
  domain      = "localdomain"
  server      = "192.168.7.20"
}

resource "opnsense_unbound_host_override" "uptime_4" {
  enabled     = true
  description = "uptime ipv4"
  type        = "A"
  hostname    = "uptime"
  domain      = "localdomain"
  server      = "192.168.7.109"
}

resource "opnsense_unbound_host_override" "uptime_6" {
  enabled     = true
  description = "uptime ipv6"
  type        = "AAAA"
  hostname    = "uptime"
  domain      = "localdomain"
  server      = "2600:6c50:73f:8273:be24:11ff:fe0a:4947"
}


resource "opnsense_unbound_host_override" "wazuh_4" {
  enabled     = true
  description = "wazuh ipv4"
  type        = "A"
  hostname    = "wazuh"
  domain      = "localdomain"
  server      = "192.168.7.111"
}

resource "opnsense_unbound_host_override" "wazuh_6" {
  enabled     = true
  description = "wazuh ipv6"
  type        = "AAAA"
  hostname    = "wazuh"
  domain      = "localdomain"
  server      = "2600:6c50:73f:8273:be24:11ff:fee6:6f79"
}
