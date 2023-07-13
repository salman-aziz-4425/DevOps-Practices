# resource "google_service_account" "default" {
#   account_id   = "service_account_id"
#   display_name = "Service Account"
# }
/*
resource "google_compute_instance" "staging_dev" {
  name         = local.name
  machine_type = local.machine_type
  zone         = local.zone

  tags = ["ssh"]

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

  #   service_account {
  #     # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
  #     email  = google_service_account.default.email
  #     scopes = ["cloud-platform"]
  #   }
}
*/

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