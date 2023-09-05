resource "google_sql_database_instance" "hylyml_sql_db_instance" {
  name             = local.sql_instance_name
  database_version = local.sql_database_version
  region           = local.sql_region
  settings {
    tier                  = local.sql_tier
    edition               = local.sql_edition
    connector_enforcement = local.sql_connector_enforcement
    disk_size             = local.sql_disk_size
    availability_type     = local.sql_availability_type
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
    maintenance_window {
      day          = local.sql_maintenance_day
      hour         = local.sql_maintenance_hour
      update_track = local.sql_update_track
    }
    backup_configuration {
      enabled            = local.sql_backup_enabled
      binary_log_enabled = local.sql_binary_log_enabled
      start_time         = local.sql_backup_start_time
      backup_retention_settings {
        retained_backups = local.sql_retained_backups
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
  name       = local.sql_root_user
  instance   = google_sql_database_instance.hylyml_sql_db_instance.name
  host       = "%"
  password   = data.google_secret_manager_secret_version.hyly_ml_mysql_root_user_password.secret_data
  project    = local.project
  depends_on = [google_sql_database_instance.hylyml_sql_db_instance]
}
resource "google_sql_user" "rails_user" {
  name       = local.sql_rails_user
  instance   = google_sql_database_instance.hylyml_sql_db_instance.name
  host       = "%"
  password   = data.google_secret_manager_secret_version.hyly_ml_mysql_rails_user_password.secret_data
  project    = local.project
  depends_on = [google_sql_database_instance.hylyml_sql_db_instance]
}
resource "google_sql_user" "xyz_user" {
  name       = local.sql_xyz_user
  instance   = google_sql_database_instance.hylyml_sql_db_instance.name
  host       = "%"
  password   = data.google_secret_manager_secret_version.hyly_ml_mysql_xyz_user_password.secret_data
  project    = local.project
  depends_on = [google_sql_database_instance.hylyml_sql_db_instance]
}