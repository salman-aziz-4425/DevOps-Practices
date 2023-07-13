output "vpc_network_id" {
  value = module.vpc.network_id
}

output "vpc_network_name" {
  value = module.vpc.network_name
}

output "subnets_names" {
  value = module.vpc.subnets_names
}