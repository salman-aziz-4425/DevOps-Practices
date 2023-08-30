/* module "gke" {
  source     = "terraform-google-modules/kubernetes-engine/google"
  project_id = local.project
  name       = local.gke_name
  network    = local.vpc_network_name

  regional             = local.gke_regional
  zones                = local.gke_zones
  subnetwork           = local.gke_subnetwork
  ip_range_pods        = local.gke_ip_range_pods
  ip_range_services    = local.gke_ip_range_services
  cluster_dns_provider = local.gke_cluster_dns_provider
  cluster_dns_scope    = local.gke_cluster_dns_scope

  remove_default_node_pool = local.gke_remove_default_node_pool
  node_pools               = local.gke_default_node_pool
  node_pools_oauth_scopes  = local.gke_node_pools_oauth_scopes

  grant_registry_access      = local.gke_grant_registry_access
  create_service_account     = local.gke_create_service_account
  enable_cost_allocation     = local.gke_enable_cost_allocation
  http_load_balancing        = local.gke_http_load_balancing
  network_policy             = local.gke_network_policy
  horizontal_pod_autoscaling = local.gke_horizontal_pod_autoscaling
  filestore_csi_driver       = local.gke_filestore_csi_driver
  logging_service            = local.gke_logging_service
  monitoring_service         = local.gke_monitoring_service

  monitoring_enable_managed_prometheus = local.gke_monitoring_enable_managed_prometheus
} */

# GKE cluster
resource "google_container_cluster" "hyly_ml_cluster" {
  name     = local.gke_name
  location = local.gke_region

  network    = local.vpc_network_name
  subnetwork = local.gke_subnetwork

  # Enabling Autopilot for this cluster
  enable_autopilot = true

  ip_allocation_policy {
    cluster_secondary_range_name  = local.gke_ip_range_pods
    services_secondary_range_name = local.gke_ip_range_services
  }

  node_config {

    oauth_scopes = [
      "https://www.googleapis.com/auth/service.management.readonly",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/trace.append",
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }
  addons_config {
    cloudrun_config { disabled = true }
    http_load_balancing { disabled = false }
    horizontal_pod_autoscaling { disabled = false }
  }
  vertical_pod_autoscaling { enabled = true }
}