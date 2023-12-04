variable "vpc_id" {
  type = string
  description = "Rails 4 VPC Sys Production"
  nullable = false
}

variable "azs" {
  type = list(string)
  description = "List of Availability Zones"
  nullable = false
}

variable "igw_id" {
  type = string
  description = "Internet Gateway ID"
  nullable = false
}


variable "cluster-name" {
  type = string
  description = "Name of New Cluster"
  nullable = false
}

variable "cluster-version" {
  type = string
  description = "Recent Value of EKS Version from AWS"
  nullable = false
}

variable "region" {
  nullable = false
}

variable "vpc-cidr-prefix" {
  nullable = false
}

# # Allow external access to cluster API
# variable "api_cidr" {
#   default = "66.219.216.0/24"
# }

# # /Networking -----------------------

# # Worker Nodes
# variable "ami_account_id" {
#   default = "602401143452" # Amazon EKS AMI Account ID
# }

# variable "instance_type" {
#   default = "c5.2xlarge"
# }

# variable "desired_capacity" {
#   default = 5
# }

# variable "max_size" {
#   default = 12
# }

# variable "min_size" {
#   default = 5
# }