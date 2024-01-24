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
    ports    = ["5000", "5001", "5010", "5011", "5005", "5006", "8501", "8502"]
  }
}

resource "google_compute_firewall" "mongo" {
  name      = "mongo-dev-staging-ml"
  network   = data.google_compute_network.hyly-network.name
  priority  = 1000
  direction = "INGRESS"

  source_ranges = local.mongo_allowed_ips_dev_staging_instance
  target_tags   = ["mongo-dev-staging-ml"]

  allow {
    protocol = "tcp"
    ports = [
      "27017", # dev mongo  
      "27027"  # staging mongo
    ]
  }
}

resource "google_compute_firewall" "jupyter_notebook" {
  name      = "jupyter-notebook"
  network   = data.google_compute_network.hyly-network.name
  priority  = 1000
  direction = "INGRESS"

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["jupyter-notebook"]

  allow {
    protocol = "tcp"
    ports    = ["8888", "8889", "8890"]
  }
}