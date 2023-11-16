variable "project" {
  type        = string
}
variable "region" {
  type        = string
}
variable "profile" {
  type        = string
}
variable "environment" {
  type        = string
}
variable "instance_type_qa_stage" {
  type        = string
}
variable "allowed_ips_for_ssh" {
  type        = list
}
variable "vpc_azs" {
  type        = list
}
variable "vpc_public_subnets" {
  type        = list
}
variable "sys_stage_vpc_id" {
  type        = string
}
variable "sys_stage_subnet_id" {
  type        = string
}

# variable "tags" {
#   type = list(object({
#     Project           = string
#     Environment             = string
#     Owner         = string
#     ManagedBy = string 
#   }))
# }