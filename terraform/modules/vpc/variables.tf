variable "region" {
  description = "Region of the vpc network."
  type        = string
}

variable "project" {
  description = "Project name on the GCP."
  type        = string
}

variable "network_name" {
  description = "Network name of vpc network."
  type        = string
}

variable "network_routing_mode" {
  description = "Network routing mode of vpc network."
  type        = string
}

variable "subnets" {
  description = "Public and private subnets of vpc network."
  type = list(object({
    subnet_name           = string
    subnet_ip             = string
    subnet_region         = string
    subnet_private_access = bool
    subnet_flow_logs      = bool
  }))
}

variable "routes" {
  description = "Routes of vpc network."
  type = list(object({
    name              = string
    description       = string
    destination_range = string
    next_hop_internet = bool
  }))
}

variable "delete_default_internet_gateway_routes" {
  description = "Delete default internet gateway routes."
  type        = bool
  default     = false
}

variable "router_name" {
  description = "Nat router name."
  type        = string
}

variable "nat_applicable_subnet_name" {
  description = "Subnet name on which you want to attach nat router."
  type        = string
}

variable "secondary_ranges" {
  description = "Secondary ranges that will be used in some of the subnets."
  type = map(list(object({
    range_name    = string,
    ip_cidr_range = string
  })))
}