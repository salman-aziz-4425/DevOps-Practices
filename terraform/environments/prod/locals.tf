locals {
  project     = "gds-prototype-20190629" # project name = GoogleDataStudio
  region      = "us-east1"
  environment = "prod"

  # Network
  vpc_network_name = "hyly-ml"

  # Ml-prod environment state bucket
  staging_dev_state_bucket_name = "ml-${local.environment}-state"
  staging_dev_bucket_location   = "us-east1"

  # Cloud sql
  sql_instance_name         = "ml-${local.environment}"
  sql_database_version      = "MYSQL_8_0"
  sql_region                = "us-east1"
  sql_tier                  = "db-g1-small"
  sql_edition               = "ENTERPRISE"
  sql_connector_enforcement = "NOT_REQUIRED"
  sql_availability_type     = "ZONAL"
  sql_maintenance_day       = 7
  sql_maintenance_hour      = 1
  sql_update_track          = "stable"
  sql_backup_enabled        = true
  sql_binary_log_enabled    = true
  sql_backup_start_time     = "01:00"
  sql_retained_backups      = 7
  sql_disk_size             = 10
  sql_ipv4_enabled          = true
  sql_root_user             = "hyly_root"
  sql_rails_user            = "hyly_rails"
  sql_xyz_user              = "hyly_xyz"
  sql_database_name         = "myhyly_production"

  sql_enable_private_path_for_google_cloud_services = true

  # Redis
  redis_name           = "ml-${local.environment}"
  redis_memory_size_gb = 2
  redis_configs        = {}
  redis_location_id    = "us-east1-b"
  redis_version        = "REDIS_6_X"
  redis_tier           = "BASIC"
  redis_region         = "us-east1"

  # GKE
  gke_name                                 = "hyly-ml-${local.environment}"
  gke_region                               = "us-east1"
  gke_zones                                = ["us-east1-b", "us-east1-c", "us-east1-d"]
  gke_cluster_dns                          = "CLOUD_DNS"
  gke_cluster_dns_domain                   = "cluster.local"
  gke_cluster_dns_scope                    = "CLUSTER_SCOPE"
  gke_cluster_dns_provider                 = "PROVIDER_UNSPECIFIED"
  gke_subnetwork                           = "public-subnet-02"
  gke_ip_range_services                    = "ip-range-services"
  gke_ip_range_pods                        = "ip-range-pods"
  gke_logging_service                      = "logging.googleapis.com/kubernetes"
  gke_monitoring_service                   = "monitoring.googleapis.com/kubernetes"
  gke_regional                             = false
  gke_create_service_account               = true
  gke_grant_registry_access                = true
  gke_enable_cost_allocation               = true
  gke_http_load_balancing                  = false
  gke_network_policy                       = false
  gke_horizontal_pod_autoscaling           = false
  gke_filestore_csi_driver                 = false
  gke_remove_default_node_pool             = true
  gke_monitoring_enable_managed_prometheus = false

  # GKE default node pool
  gke_default_node_pool = [
    {
      name            = "hyly-default"
      machine_type    = "e2-standard-2"
      node_locations  = "us-east1-c,us-east1-d"
      min_count       = 1
      max_count       = 2
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
      node_count         = 1
      autoscaling        = false
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
  atlas_org_id          = "64e478e6c738112717212e2d"
  atlas_project_name    = "Hyly-ml-${local.environment}"
  atlas_cluster_region  = "EASTERN_US"
  atlas_cluster_tier    = "M10"
  atlas_cluster_name    = "hyly-ml-${local.environment}"
  atlas_provider_name   = "GCP"
  atlas_cluster_type    = "REPLICASET"
  atlas_cluster_version = "5.0"
  mongo_db_user_1       = "hyly_xyz"
  mongo_db_user_2       = "hyly_rails"
  mongo_db_user_root    = "hyly_root"
  atlas_uri = replace(
    mongodbatlas_cluster.hyly_ml_cluster.srv_address,
    "://",
    "://${local.mongo_db_user_1}:${mongodbatlas_database_user.xyz_user.password}@"
  )

  # MongoDB allowed IPs for prod clusters
  mongoatlas_allowed_ips_all_clusters_prod = [
    "173.32.45.37",    # Urvish Mongo HP-omen
    "107.21.115.107",  # QA Server IP
    "3.91.102.27",     # LIVE app8
    "44.201.135.127",  # LIVE app-p7
    "54.235.68.60",    # LIVE app-p5
    "184.73.153.116",  # LIVE app6
    "3.90.64.59",      # LIVE app-p6
    "182.70.113.18",   # Ashish IP
    "84.17.57.57",     # Ashish IP2 mongoDB
    "72.255.21.197",   # Waleed IP 
    "3.235.238.79",    # server mongodb prompt-modeler
    "34.74.55.254",    # staging-dev-ml on GCP
    "142.114.73.72",   # Urvish Mongo
    "103.152.101.5",   # Badar IP 
    "113.188.118.33",  # Tin IP
    "103.179.50.208",  # urvish mongo
    "103.152.101.216", # Junaid IP
    "58.27.193.244",   # Junaid IP2
  ]

  # Actifact repository
  repo_name = "ml-prod"
}