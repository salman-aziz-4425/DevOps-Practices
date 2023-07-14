resource "google_service_account" "staging_dev_sa" {
  account_id   = "staging-dev-sa"
  display_name = "Staging-dev Service Account"
  project = local.project
}
resource "google_compute_instance" "staging_dev" {
  name         = local.name
  machine_type = local.machine_type
  zone         = local.zone

  tags                      = ["ssh"]
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
      // Ephemeral/Static public IP
    }
  }

  metadata = {
    ssh-keys = local.allowed_ssh_pub_keys
  }

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = google_service_account.staging_dev_sa.email
    scopes = ["cloud-platform"]
  }
  depends_on = [ google_service_account.staging_dev_sa ]
}

resource "google_compute_firewall" "ssh" {
  name      = "ssh-firewall-rule"
  network   = data.google_compute_network.hyly-network.name
  priority  = 1000
  direction = "INGRESS"

  source_ranges = local.allowed_ips_for_ssh
  target_tags   = ["ssh"]

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
}