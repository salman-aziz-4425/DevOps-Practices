variable "env" {
  description = "Environment name to target."
  type        = string
}

variable "vpc_cidr_block" {
  description = "CIDR (Classless Inter-Domain Routing) Block."
  type        = string
  default     = "10.0.0.0/16"
}

variable "azs" {
  description = "List of Availability zones for subnets."
  type        = list(string)
}

variable "public_subnets" {
  description = "CIDR ranges for public subnets."
  type        = list(string)
}

# variable "public_subnet_tags" {
#   description = "Public subnet tags."
#   type        = map(any)
# }