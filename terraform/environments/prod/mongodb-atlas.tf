resource "mongodbatlas_project" "hyly_ml" {
  name   = local.atlas_project_name
  org_id = local.atlas_org_id
}

resource "mongodbatlas_project_ip_access_list" "acl" {
  project_id = mongodbatlas_project.hyly_ml.id
  cidr_block = "0.0.0.0/0"
}

resource "mongodbatlas_cluster" "hyly_ml_cluster" {
  project_id   = mongodbatlas_project.hyly_ml.id
  name         = local.atlas_cluster_name
  cluster_type = local.atlas_cluster_type

  provider_name               = local.atlas_provider_name
  provider_region_name        = local.atlas_cluster_region
  provider_instance_size_name = local.atlas_cluster_tier
}

resource "mongodbatlas_database_user" "user" {
  project_id         = mongodbatlas_project.hyly_ml.id
  auth_database_name = "admin"

  username = local.db_user
  password = data.google_secret_manager_secret_version.hyly_ml_sql_password.secret_data

  roles {
    role_name     = "readWrite"
    database_name = local.db_name
  }
}