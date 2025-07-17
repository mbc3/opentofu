resource "pihole_cname_record" "bao_openbao" {
  domain = "bao.openbao.localdomain"
  target = "openbao.localdomain"
}

resource "pihole_cname_record" "books_mediapi" {
  domain = "books.mediapi.localdomain"
  target = "mediapi.localdomain"
}

resource "pihole_cname_record" "box_netbox" {
  domain = "box.netbox.localdomain"
  target = "netbox.localdomain"
}

resource "pihole_cname_record" "freeipa_auth" {
  domain = "freeipa.auth.localdomain"
  target = "freeipa.localdomain"
}

resource "pihole_cname_record" "images_mediapi" {
  domain = "images.mediapi.localdomain"
  target = "mediapi.localdomain"
}

resource "pihole_cname_record" "pdf_mediapi" {
  domain = "pdf.mediapi.localdomain"
  target = "mediapi.localdomain"
}

resource "pihole_cname_record" "rslsync_files" {
  domain = "rslsync.files.localdomain"
  target = "files.localdomain"
}

resource "pihole_cname_record" "run_semaphore" {
  domain = "run.semaphore.localdomain"
  target = "semaphore.localdomain"
}

resource "pihole_cname_record" "search_mediapi" {
  domain = "search.mediapi.localdomain"
  target = "mediapi.localdomain"
}

resource "pihole_cname_record" "syncthing_files" {
  domain = "syncthing.files.localdomain"
  target = "files.localdomain"
}

resource "pihole_cname_record" "syncthing_mediapi" {
  domain = "syncthing.mediapi.localdomain"
  target = "mediapi.localdomain"
}

resource "pihole_cname_record" "torrent_files" {
  domain = "torrent.files.localdomain"
  target = "files.localdomain"
}

resource "pihole_cname_record" "up_uptime" {
  domain = "up.uptime.localdomain"
  target = "uptime.localdomain"
}
