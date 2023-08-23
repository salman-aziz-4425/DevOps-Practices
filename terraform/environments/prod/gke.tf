module "gke" {
  source     = "terraform-google-modules/kubernetes-engine/google"
  project_id = local.project
  name       = local.gke_name

  regional             = local.gke_regional
  zones                = local.gke_zones
  network              = data.google_compute_network.hyly-network.id
  subnetwork           = local.gke_subnetwork
  ip_range_pods        = local.gke_ip_range_pods
  ip_range_services    = local.gke_ip_range_services
  cluster_dns_provider = local.gke_cluster_dns_provider
  cluster_dns_scope    = local.gke_cluster_dns_scope

  grant_registry_access  = local.gke_grant_registry_access
  create_service_account = local.gke_create_service_account
  enable_cost_allocation = local.gke_enable_cost_allocation

  http_load_balancing        = local.gke_http_load_balancing
  network_policy             = local.gke_network_policy
  horizontal_pod_autoscaling = local.gke_horizontal_pod_autoscaling
  filestore_csi_driver       = local.gke_filestore_csi_driver
  logging_service            = local.gke_logging_service
  monitoring_service         = local.gke_monitoring_service

  remove_default_node_pool = local.gke_remove_default_node_pool
  node_pools               = local.gke_default_node_pool
  node_pools_oauth_scopes  = local.gke_node_pools_oauth_scopes
}