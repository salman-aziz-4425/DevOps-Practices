data "google_compute_network" "hyly-network" {
  name = local.vpc_network_name
}