variable "project" {
  type        = string
  description = "Project name"
}
variable "region" {
  type        = string
  default = "region name"
}
variable "ec2_ami_id" {
  type        = string
  default = "EC2 AMI ID"
}
variable "profile" {
  type        = string
  default = "Profile"
}
variable "environment" {
  type        = string
  description = "project environement"
}
variable "instance_type" {
  type        = string
  description = "Instance type"
}
variable "allowed_ips_for_ssh" {
  type        = list
  description = "allows IP for ssh"
}
variable "vpc_azs" {
  type        = list
  description = "availability zones"
}
variable "vpc_public_subnets" {
  type        = list
  description = "public subnets"
}
variable "vpc_id" {
  type        = string
  description = "VPC"
}
variable "subnet_id" {
  type        = string
  description = "subnet"
}

