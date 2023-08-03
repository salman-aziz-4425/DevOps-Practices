resource "google_service_account" "staging_dev_sa" {
  account_id   = "staging-dev-sa"
  display_name = "Staging-dev Service Account"
  project      = local.project
}
resource "google_compute_address" "staging_dev_static" {
  name = "staging-dev-ipv4-address"
}
resource "google_project_iam_binding" "staging_dev_sa_token_creator" {
  project = local.project
  role    = "roles/iam.serviceAccountTokenCreator"
  members = ["serviceAccount:${google_service_account.staging_dev_sa.email}"]
}
resource "google_project_iam_binding" "staging_dev_sa_storage" {
  project = local.project
  role    = "roles/storage.objectAdmin"
  members = ["serviceAccount:${google_service_account.staging_dev_sa.email}"]
}
resource "google_project_iam_binding" "staging_dev_sa_bigquery" {
  project = local.project
  role    = "roles/bigquery.dataOwner"
  members = ["serviceAccount:${google_service_account.staging_dev_sa.email}"]
}
resource "google_project_iam_binding" "staging_dev_sa_bigquery_admin" {
  project = local.project
  role    = "roles/bigquery.admin"
  members = ["serviceAccount:${google_service_account.staging_dev_sa.email}"]
}
resource "google_project_iam_binding" "staging_dev_sa_storage_admin" {
  project = local.project
  role    = "roles/storage.admin"
  members = ["serviceAccount:${google_service_account.staging_dev_sa.email}"]
}
resource "google_project_iam_binding" "staging_dev_sa_dataflow_admin" {
  project = local.project
  role    = "roles/dataflow.admin"
  members = ["serviceAccount:${google_service_account.staging_dev_sa.email}"]
}
resource "google_project_iam_binding" "staging_dev_sa_dataflow_worker" {
  project = local.project
  role    = "roles/dataflow.worker"
  members = ["serviceAccount:${google_service_account.staging_dev_sa.email}"]
}
resource "google_project_iam_binding" "staging_dev_sa_workflow_admin" {
  project = local.project
  role    = "roles/workflows.admin"
  members = ["serviceAccount:${google_service_account.staging_dev_sa.email}"]
}
resource "google_project_iam_binding" "staging_dev_sa_artifact_registry" {
  project = local.project
  role    = "roles/artifactregistry.reader"
  members = ["serviceAccount:${google_service_account.staging_dev_sa.email}"]
}
resource "google_compute_instance" "staging_dev" {
  name         = local.name
  machine_type = local.machine_type
  zone         = local.zone

  tags = [
    "ssh-public",
    "flask-app",
    "public-access-http-https",
    "jupyter-notebook"
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