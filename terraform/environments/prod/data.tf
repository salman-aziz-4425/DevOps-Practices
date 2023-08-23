data "google_compute_network" "hyly-network" {
  name = local.vpc_network_name
}
data "google_secret_manager_secret_version" "hyly_ml_sql_password" {
  secret = "hyly-ml-sql-password"
}
data "google_secret_manager_secret_version" "atlas_public_key" {
  secret = "atlas-public-key"
}
data "google_secret_manager_secret_version" "atlas_private_key" {
  secret = "atlas-private-key"
}
# google_client_config must be explicitly specified like the following for GKE module.
data "google_client_config" "default" {}