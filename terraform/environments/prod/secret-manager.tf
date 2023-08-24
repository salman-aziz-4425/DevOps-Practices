resource "google_secret_manager_secret" "hyly_ml_sql_password" {
  secret_id = "hyly-ml-sql-password"

  replication {
    automatic = true
  }
}
resource "google_secret_manager_secret" "hyly_ml_mongo_password" {
  secret_id = "hyly-ml-mongo-password"

  replication {
    automatic = true
  }
}
resource "google_secret_manager_secret" "atlas_public_key" {
  secret_id = "atlas-public-key"

  replication {
    automatic = true
  }
}
resource "google_secret_manager_secret" "atlas_private_key" {
  secret_id = "atlas-private-key"

  replication {
    automatic = true
  }
}