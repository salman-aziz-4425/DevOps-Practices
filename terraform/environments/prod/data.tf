data "google_compute_network" "hyly-network" {
  name = local.vpc_network_name
}
data "google_secret_manager_secret_version" "hyly_ml_mysql_root_user_password" {
  secret = "hyly-ml-mysql-root-user-password"
}
data "google_secret_manager_secret_version" "hyly_ml_mysql_rails_user_password" {
  secret = "hyly-ml-mysql-rails-user-password"
}
data "google_secret_manager_secret_version" "hyly_ml_mysql_xyz_user_password" {
  secret = "hyly-ml-mysql-xyz-user-password"
}
data "google_secret_manager_secret_version" "hyly_ml_mongo_root_user_password" {
  secret = "hyly-ml-mongo-root-user-password"
}
data "google_secret_manager_secret_version" "hyly_ml_mongo_xyz_user_password" {
  secret = "hyly-ml-mongo-xyz-user-password"
}
data "google_secret_manager_secret_version" "hyly_ml_mongo_rails_user_password" {
  secret = "hyly-ml-mongo-rails-user-password"
}
data "google_secret_manager_secret_version" "atlas_public_key" {
  secret = "atlas-public-key"
}
data "google_secret_manager_secret_version" "atlas_private_key" {
  secret = "atlas-private-key"
}
# google_client_config must be explicitly specified like the following for GKE module.
data "google_client_config" "default" {}