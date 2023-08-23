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
  sql_instance_name                                 = "ml-prod"
  sql_database_version                              = "MYSQL_8_0"
  sql_region                                        = "us-east1"
  sql_tier                                          = "db-g1-small"
  sql_edition                                       = "ENTERPRISE"
  sql_connector_enforcement                         = "NOT_REQUIRED"
  sql_disk_size                                     = 10
  sql_ipv4_enabled                                  = true
  sql_enable_private_path_for_google_cloud_services = true
  sql_database_name                                 = "test-database" # TODO: change this later

  # redis
  redis_name           = "ml-prod"
  redis_memory_size_gb = 2
  redis_configs        = {}
  redis_location_id    = "us-east1-b"
  redis_version        = "REDIS_6_X"
  redis_tier           = "BASIC"
  redis_region         = "us-east1"

  # GKE
  gke_name                       = "hyly-ml-prod"
  gke_region                     = "us-east1"
  gke_zones                      = ["us-east1-b", "us-east1-c", "us-east1-d"]
  gke_cluster_dns_scope          = "VPC_SCOPE"
  gke_cluster_dns_provider       = "CLOUD_DNS"
  gke_subnetwork                 = "public-subnet-02"
  gke_ip_range_services          = "ip-range-services"
  gke_ip_range_pods              = "ip-range-pods"
  gke_logging_service            = "logging.googleapis.com/kubernetes"
  gke_monitoring_service         = "monitoring.googleapis.com/kubernetes"
  gke_regional                   = false
  gke_create_service_account     = true
  gke_grant_registry_access      = true
  gke_enable_cost_allocation     = true
  gke_http_load_balancing        = false
  gke_network_policy             = false
  gke_horizontal_pod_autoscaling = false
  gke_filestore_csi_driver       = false
  gke_remove_default_node_pool   = true

  # GKE default node pool
  gke_default_node_pool = [
    {
      name            = "hyly-default"
      machine_type    = "e2-standard-2"
      node_locations  = "us-east1-b,us-east1-c,us-east1-d"
      min_count       = 1
      max_count       = 3
      local_ssd_count = 0
      spot            = false
      disk_size_gb    = 40
      disk_type       = "pd-standard"
      image_type      = "COS_CONTAINERD"
      enable_gcfs     = false
      enable_gvnic    = false
      auto_repair     = true
      auto_upgrade    = true
      /* service_account           = "project-service-account@<PROJECT ID>.iam.gserviceaccount.com" */
      preemptible        = false
      initial_node_count = 1
    },
  ]
  gke_node_pools_oauth_scopes = {
    all = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }

  # mongodb atlas
  atlas_org_id         = "64e478e6c738112717212e2d"
  atlas_project_name   = "Hyly-ai-prod"
  atlas_cluster_region = "EASTERN_US"
  atlas_cluster_tier   = "M10"
  atlas_cluster_name   = "hyly-ml-prod"
  atlas_provider_name  = "GCP"
  atlas_cluster_type   = "REPLICASET"
  db_user              = "mongo"
  db_name              = "hylyai"
  atlas_uri = replace(
    mongodbatlas_cluster.hyly_ml_cluster.srv_address,
    "://",
    "://${local.db_user}:${mongodbatlas_database_user.user.password}@"
  )
}