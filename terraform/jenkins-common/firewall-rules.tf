resource "google_compute_firewall" "public_access" {
  name      = "public-access-rule"
  network   = data.google_compute_network.hyly-network.name
  priority  = 1000
  direction = "INGRESS"

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["public-access-http-https"]

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }
}

resource "google_compute_firewall" "jenkins_public_access" {
  name      = "jenkins-access-rule"
  network   = data.google_compute_network.hyly-network.name
  priority  = 1000
  direction = "INGRESS"

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["jenkins-access"]

  allow {
    protocol = "tcp"
    ports    = ["8080"]
  }
}
