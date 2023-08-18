locals {
  project     = "gds-prototype-20190629" # project name = GoogleDataStudio
  region      = "us-east1"
  environment = "prod"

  # network
  vpc_network_name = "hyly-ml"

  # ml-prod environment state bucket
  staging_dev_state_bucket_name = "ml-prod-state"
  staging_dev_bucket_location   = "us-east1"

  # cloud sql
  sql_instance_name = "ml-prod-sql-instance"
  sql_database_version = "MYSQL_8_0"
  sql_region = "us-east1"
  sql_tier = "db-g1-small"
  sql_edition = "ENTERPRISE"
  sql_connector_enforcement = "NOT_REQUIRED"
  sql_disk_size = 10
  sql_ipv4_enabled = true
  sql_enable_private_path_for_google_cloud_services = true
  sql_database_name = "ml-prod"

  # redis
  redis_name = "ml-prod"
  redis_memory_size_gb = 2
  redis_configs = {}
  redis_location_id = "us-east1-b"
  redis_version = "REDIS_6_X"
  redis_tier = "BASIC"
  redis_region = "us-east1"
}