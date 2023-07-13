# https://github.com/terraform-google-modules/terraform-google-network
module "vpc" {
  source  = "terraform-google-modules/network/google"
  version = "~> 7.1"

  project_id   = var.project
  network_name = var.network_name
  routing_mode = var.network_routing_mode

  delete_default_internet_gateway_routes = var.delete_default_internet_gateway_routes

  subnets = var.subnets
  routes = var.routes
}

# https://github.com/terraform-google-modules/terraform-google-cloud-router
module "cloud_router" {
  source  = "terraform-google-modules/cloud-router/google"
  version = "~> 5.0"

  name    = var.router_name
  project = var.project
  region  = var.region
  network = module.vpc.network_name
  nats = [{
    name                               = "nat"
    nat_ip_allocate_option             = "AUTO_ONLY"
    source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
    subnetworks = [{
      name                    = var.nat_applicable_subnet_name
      source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
    }]
  }]
}