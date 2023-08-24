resource "google_sql_database_instance" "hylyml_sql_db_instance" {
  name             = local.sql_instance_name
  database_version = local.sql_database_version
  region           = local.sql_region
  settings {
    tier                  = local.sql_tier
    edition               = local.sql_edition
    connector_enforcement = local.sql_connector_enforcement
    disk_size             = local.sql_disk_size
    ip_configuration {
      ipv4_enabled = local.sql_ipv4_enabled

      # Configuring a Cloud SQL instance to use private IP requires private services access.
      # https://cloud.google.com/sql/docs/mysql/private-ip
      # private_network                               = data.google_compute_network.hyly-network.id
      # enable_private_path_for_google_cloud_services = local.sql_enable_private_path_for_google_cloud_services
      authorized_networks {
        # TODO: Provide CIDR of GKE
        name  = "Internet"
        value = "0.0.0.0/32"
      }
    }
  }
}

resource "google_sql_database" "hylyml_sql_db" {
  name       = local.sql_database_name
  instance   = google_sql_database_instance.hylyml_sql_db_instance.name
  depends_on = [google_sql_database_instance.hylyml_sql_db_instance]
}

resource "google_sql_user" "root_user" {
  name       = "root"
  instance   = google_sql_database_instance.hylyml_sql_db_instance.name
  host       = "%"
  password   = data.google_secret_manager_secret_version.hyly_ml_sql_password.secret_data
  project    = local.project
  depends_on = [google_sql_database_instance.hylyml_sql_db_instance]
}