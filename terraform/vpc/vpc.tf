module "vpc" {
  source = "../modules/vpc"

  region                                 = local.region
  project                                = local.project
  network_name                           = local.vpc_network_name
  network_routing_mode                   = local.vpc_network_routing_mode
  subnets                                = local.vpc_subnets
  routes                                 = local.vpc_routes
  delete_default_internet_gateway_routes = local.vpc_delete_default_internet_gateway_routes
  router_name                            = local.vpc_router_name
  nat_applicable_subnet_name             = local.vpc_nat_applicable_subnet_name
  providers = {
    google      = google
    google-beta = google-beta.google-beta
  }
}