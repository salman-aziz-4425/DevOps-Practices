resource "google_redis_instance" "hylyml_redis" {
  name           = local.redis_name
  memory_size_gb = local.redis_memory_size_gb
  redis_version  = local.redis_version
  tier           = local.redis_tier

  authorized_network = data.google_compute_network.hyly-network.id
  redis_configs      = tomap(local.redis_configs)
  location_id        = local.redis_location_id

  project = local.project
  region  = local.redis_region
  persistence_config {
    persistence_mode = "DISABLED"
  }
}