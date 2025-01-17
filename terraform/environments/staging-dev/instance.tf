resource "google_service_account" "staging_dev_sa" {
  account_id   = "staging-dev-sa"
  display_name = "Staging-dev Service Account"
  project      = local.project
}
resource "google_compute_address" "staging_dev_static" {
  name = "staging-dev-ipv4-address"
}
resource "google_project_iam_member" "staging_dev_sa_role_members" {
  for_each = local.iam_members
  project  = local.project
  role     = each.value
  member   = "serviceAccount:${google_service_account.staging_dev_sa.email}"

  depends_on = [google_project_iam_binding.staging_dev_sa_bigquery_admin, google_project_iam_binding.staging_dev_sa_storage_admin]
}
resource "google_compute_instance" "staging_dev" {
  name         = local.name
  machine_type = local.machine_type
  zone         = local.zone

  tags = [
    "ssh-public",
    "flask-app",
    "public-access-http-https",
    "jupyter-notebook",
    "mongo-dev-staging-ml"
  ]
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
      nat_ip = google_compute_address.staging_dev_static.address
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
  depends_on = [google_service_account.staging_dev_sa]
}