resource "google_service_account" "jenkins_sa" {
  account_id   = "jenkins-sa"
  display_name = "Jenkins Service Account"
  project      = local.project
}
resource "google_compute_address" "static" {
  name = "ipv4-address"
}
resource "google_compute_instance" "jenkins" {
  name         = local.name
  machine_type = local.machine_type
  zone         = local.zone

  tags                      = ["ssh", "publicaccess"]
  allow_stopping_for_update = local.allow_stopping_for_update
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      labels = {
        owner       = "terraform"
        managed_by  = "junaid-ali"
        environment = local.environment
      }

      size = local.disk_size
    }
  }
  network_interface {
    network    = data.google_compute_network.hyly-network.name
    subnetwork = data.google_compute_network.hyly-network.subnetworks_self_links[0] # public subnet

    access_config {
      nat_ip = google_compute_address.static.address
    }
  }

  metadata = {
    ssh-keys = local.allowed_ssh_pub_keys
  }

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = google_service_account.jenkins_sa.email
    scopes = ["cloud-platform"]
  }
  depends_on = [google_service_account.jenkins_sa]
}

resource "google_compute_firewall" "public_access" {
  name      = "public-access-rule"
  network   = data.google_compute_network.hyly-network.name
  priority  = 1000
  direction = "INGRESS"

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["publicaccess"]

  allow {
    protocol = "tcp"
    ports    = ["8080", "80", "443"]
  }
}