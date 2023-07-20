resource "google_compute_firewall" "ssh" {
  name      = "ssh-firewall-rule"
  network   = data.google_compute_network.hyly-network.name
  priority  = 1000
  direction = "INGRESS"

  source_ranges = ["0.0.0.0/0"] #local.allowed_ips_for_ssh
  target_tags   = ["ssh-public"]

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
}

resource "google_compute_firewall" "flask_app" {
  name      = "flask-app"
  network   = data.google_compute_network.hyly-network.name
  priority  = 1000
  direction = "INGRESS"

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["flask-app"]

  allow {
    protocol = "tcp"
    ports    = ["5000"]
  }
}