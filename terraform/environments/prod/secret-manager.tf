resource "google_secret_manager_secret" "hyly_ml_mysql_root_user_password" {
  secret_id = "hyly-ml-mysql-root-user-password"

  replication {
    automatic = true
  }
}
resource "google_secret_manager_secret" "hyly_ml_mysql_rails_user_password" {
  secret_id = "hyly-ml-mysql-rails-user-password"

  replication {
    automatic = true
  }
}
resource "google_secret_manager_secret" "hyly_ml_mysql_xyz_user_password" {
  secret_id = "hyly-ml-mysql-xyz-user-password"

  replication {
    automatic = true
  }
}
resource "google_secret_manager_secret" "hyly_ml_mongo_root_user_password" {
  secret_id = "hyly-ml-mongo-root-user-password"

  replication {
    automatic = true
  }
}
resource "google_secret_manager_secret" "hyly_ml_mongo_xyz_user_password" {
  secret_id = "hyly-ml-mongo-xyz-user-password"

  replication {
    automatic = true
  }
}
resource "google_secret_manager_secret" "hyly_ml_mongo_rails_user_password" {
  secret_id = "hyly-ml-mongo-rails-user-password"

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