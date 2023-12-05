variable "project" {
  type        = string
  description = "Name of the project or application this infrastructure is for."
}

variable "region" {
  type        = string
  description = "The AWS region where resources will be provisioned."
}

variable "ec2_ami_id" {
  type        = string
  description = "ID of the Amazon Machine Image (AMI) used to launch the EC2 instances."
}

variable "profile" {
  type        = string
  description = "AWS named profile to use for authentication and permissions."
}

variable "environment" {
  type        = string
  description = "Environment (e.g., development, staging, production) for this infrastructure."
}

variable "instance_type" {
  type        = string
  description = "Type of EC2 instance to be launched."
}

variable "allowed_ips_for_ssh" {
  type        = list
  description = "List of allowed IP addresses for SSH access to instances."
}

variable "vpc_azs" {
  type        = list
  description = "List of availability zones to deploy resources across for high availability."
}

variable "vpc_public_subnets" {
  type        = list
  description = "List of public subnets within the VPC for deploying public-facing resources."
}

variable "vpc_id" {
  type        = string
  description = "The ID of the Virtual Private Cloud (VPC) where resources will be created."
}

variable "subnet_id" {
  type        = string
  description = "The ID of the subnet in which EC2 instances will be launched."
}

variable "ec2_server_iam_policies" {
  description = "Map of IAM Policies to attach to EC2 server instances."
  type        = map(any)
  default     = {}
}
