resource "opnsense_unbound_host_alias" "bao4" {
  override = opnsense_unbound_host_override.openbao_4.id

  enabled     = true
  hostname    = "bao"
  domain      = "openbao.localdomain"
  description = "Bao IPv4"
}

resource "opnsense_unbound_host_alias" "bao6" {
  override = opnsense_unbound_host_override.openbao_6.id

  enabled     = true
  hostname    = "bao"
  domain      = "openbao.localdomain"
  description = "Bao IPv6"
}

resource "opnsense_unbound_host_alias" "books4" {
  override = opnsense_unbound_host_override.mediapi_4.id

  enabled     = true
  hostname    = "books"
  domain      = "mediapi.localdomain"
  description = "Books IPv4"
}


resource "opnsense_unbound_host_alias" "books6" {
  override = opnsense_unbound_host_override.mediapi_6.id

  enabled     = true
  hostname    = "books"
  domain      = "mediapi.localdomain"
  description = "Books IPv6"
}

resource "opnsense_unbound_host_alias" "box4" {
  override = opnsense_unbound_host_override.netbox_4.id

  enabled     = true
  hostname    = "box"
  domain      = "netbox.localdomain"
  description = "Box IPv4"
}

resource "opnsense_unbound_host_alias" "box6" {
  override = opnsense_unbound_host_override.netbox_6.id

  enabled     = true
  hostname    = "box"
  domain      = "netbox.localdomain"
  description = "Box IPv6"
}

resource "opnsense_unbound_host_alias" "cooking4" {
  override = opnsense_unbound_host_override.hosted_4.id

  enabled     = true
  hostname    = "cooking"
  domain      = "hosted.localdomain"
  description = "Cooking IPv4"
}

resource "opnsense_unbound_host_alias" "cooking6" {
  override = opnsense_unbound_host_override.hosted_6.id

  enabled     = true
  hostname    = "cooking"
  domain      = "hosted.localdomain"
  description = "Cooking IPv6"
}

resource "opnsense_unbound_host_alias" "auth4" {
  override = opnsense_unbound_host_override.freeipa_4.id

  enabled     = true
  hostname    = "freeipa"
  domain      = "auth.localdomain"
  description = "Auth IPv4"
}

resource "opnsense_unbound_host_alias" "auth6" {
  override = opnsense_unbound_host_override.freeipa_6.id

  enabled     = true
  hostname    = "freeipa"
  domain      = "auth.localdomain"
  description = "Auth IPv6"
}

resource "opnsense_unbound_host_alias" "grafana4" {
  override = opnsense_unbound_host_override.graphs_4.id

  enabled     = true
  hostname    = "grafana"
  domain      = "graphs.localdomain"
  description = "Grafana IPv4"
}


resource "opnsense_unbound_host_alias" "grafana6" {
  override = opnsense_unbound_host_override.graphs_6.id

  enabled     = true
  hostname    = "grafana"
  domain      = "graphs.localdomain"
  description = "Grafana IPv6"
}

resource "opnsense_unbound_host_alias" "images4" {
  override = opnsense_unbound_host_override.mediapi_4.id

  enabled     = true
  hostname    = "images"
  domain      = "mediapi.localdomain"
  description = "Images IPv4"
}


resource "opnsense_unbound_host_alias" "images6" {
  override = opnsense_unbound_host_override.mediapi_6.id

  enabled     = true
  hostname    = "images"
  domain      = "mediapi.localdomain"
  description = "Images IPv6"
}

resource "opnsense_unbound_host_alias" "loki4" {
  override = opnsense_unbound_host_override.logs_4.id

  enabled     = true
  hostname    = "loki"
  domain      = "logs.localdomain"
  description = "Loki IPv4"
}

resource "opnsense_unbound_host_alias" "loki6" {
  override = opnsense_unbound_host_override.logs_6.id

  enabled     = true
  hostname    = "loki"
  domain      = "logs.localdomain"
  description = "Loki IPv6"
}

resource "opnsense_unbound_host_alias" "alloy4" {
  override = opnsense_unbound_host_override.logs_4.id

  enabled     = true
  hostname    = "alloy"
  domain      = "logs.localdomain"
  description = "Alloy IPv4"
}

resource "opnsense_unbound_host_alias" "alloy6" {
  override = opnsense_unbound_host_override.logs_6.id

  enabled     = true
  hostname    = "alloy"
  domain      = "logs.localdomain"
  description = "Alloy IPv6"
}

resource "opnsense_unbound_host_alias" "pdf4" {
  override = opnsense_unbound_host_override.hosted_4.id

  enabled     = true
  hostname    = "pdf"
  domain      = "hosted.localdomain"
  description = "PDF IPv4"
}

resource "opnsense_unbound_host_alias" "pdf6" {
  override = opnsense_unbound_host_override.hosted_6.id

  enabled     = true
  hostname    = "pdf"
  domain      = "hosted.localdomain"
  description = "PDF IPv6"
}

resource "opnsense_unbound_host_alias" "prometheus4" {
  override = opnsense_unbound_host_override.graphs_4.id

  enabled     = true
  hostname    = "prometheus"
  domain      = "graphs.localdomain"
  description = "Prometheus IPv4"
}

resource "opnsense_unbound_host_alias" "prometheus6" {
  override = opnsense_unbound_host_override.graphs_6.id

  enabled     = true
  hostname    = "prometheus"
  domain      = "graphs.localdomain"
  description = "Prometheus IPv6"
}

resource "opnsense_unbound_host_alias" "search_4" {
  override = opnsense_unbound_host_override.hosted_4.id

  enabled     = true
  hostname    = "search"
  domain      = "hosted.localdomain"
  description = "Search IPv4"
}

resource "opnsense_unbound_host_alias" "search_6" {
  override = opnsense_unbound_host_override.hosted_6.id

  enabled     = true
  hostname    = "search"
  domain      = "hosted.localdomain"
  description = "Search IPv6"
}

resource "opnsense_unbound_host_alias" "syncthing4" {
  override = opnsense_unbound_host_override.files_4.id

  enabled     = true
  hostname    = "syncthing"
  domain      = "files.localdomain"
  description = "Syncthing IPv4"
}


resource "opnsense_unbound_host_alias" "syncthing6" {
  override = opnsense_unbound_host_override.files_6.id

  enabled     = true
  hostname    = "syncthing"
  domain      = "files.localdomain"
  description = "Syncthing IPv6"
}

resource "opnsense_unbound_host_alias" "syncthing_pi4" {
  override = opnsense_unbound_host_override.mediapi_4.id

  enabled     = true
  hostname    = "syncthing"
  domain      = "mediapi.localdomain"
  description = "Syncthing Mediapi IPv4"
}


resource "opnsense_unbound_host_alias" "syncthing_pi6" {
  override = opnsense_unbound_host_override.mediapi_6.id

  enabled     = true
  hostname    = "syncthing"
  domain      = "mediapi.localdomain"
  description = "Syncthing Mediapi IPv6"
}


resource "opnsense_unbound_host_alias" "torrent4" {
  override = opnsense_unbound_host_override.files_4.id

  enabled     = true
  hostname    = "torrent"
  domain      = "files.localdomain"
  description = "Torrent IPv4"
}


resource "opnsense_unbound_host_alias" "torrent6" {
  override = opnsense_unbound_host_override.files_6.id

  enabled     = true
  hostname    = "torrent"
  domain      = "files.localdomain"
  description = "Torrent IPv6"
}

resource "opnsense_unbound_host_alias" "up4" {
  override = opnsense_unbound_host_override.hosted_4.id

  enabled     = true
  hostname    = "up"
  domain      = "hosted.localdomain"
  description = "Up IPv4"
}


resource "opnsense_unbound_host_alias" "uptime6" {
  override = opnsense_unbound_host_override.hosted_6.id

  enabled     = true
  hostname    = "up"
  domain      = "hosted.localdomain"
  description = "Up IPv6"
}
