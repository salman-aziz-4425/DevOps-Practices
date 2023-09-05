locals {
  project = "gds-prototype-20190629" # project name = GoogleDataStudio
  region  = "us-east1"

  # vpc network locals
  vpc_network_name         = "hyly-ml"
  vpc_network_routing_mode = "REGIONAL"

  # provide two subnets public and private
  vpc_subnets = [
    {
      subnet_name           = "public-subnet"
      subnet_ip             = "10.0.0.0/24"
      subnet_region         = "us-east1"
      subnet_private_access = "false"
      subnet_flow_logs      = "false"
    },
    {
      subnet_name           = "private-subnet"
      subnet_ip             = "10.0.1.0/24"
      subnet_region         = "us-east1"
      subnet_private_access = "true"
      subnet_flow_logs      = "false"
    },
    {
      subnet_name           = "public-subnet-02"
      subnet_ip             = "10.10.0.0/16"
      subnet_region         = "us-east1"
      subnet_private_access = "false"
      subnet_flow_logs      = "false"
    }
  ]

  vpc_secondary_ranges = {
    "public-subnet-02" = [
      {
        range_name    = "ip-range-pods"
        ip_cidr_range = "10.20.0.0/16"
      },
      {
        range_name    = "ip-range-services"
        ip_cidr_range = "10.30.0.0/16"
      },
    ]
  }

  # egress
  vpc_delete_default_internet_gateway_routes = true
  vpc_routes = [
    {
      name              = "egress-internet"
      description       = "Default route through IGW to access internet"
      destination_range = "0.0.0.0/0"
      next_hop_internet = "true"
    }
  ]

  # nat
  vpc_router_name                = "nat-router"
  vpc_nat_applicable_subnet_name = local.vpc_subnets[1].subnet_name

  # vpc state bucket
  vpc_state_bucket_name     = "vpc-state"
  vpc_state_bucket_location = "us-east1"
}