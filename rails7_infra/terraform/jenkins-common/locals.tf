locals {
  #Jenkins instance locals
  project               = "myhyly"
  region                = "us-east-1"
  profile               = "246071984618_Terraform"
  environment           = "jenkins"
  instance_type_jenkins = "m7a.medium"

  allowed_ips_for_ssh = [
    "14.237.225.29/32",  # Tin IP
    "122.129.66.106/32", # Junaid IP
    "58.27.193.244/32"   # Junaid IP
  ]

  vpc_azs = ["us-east-2a", "us-east-2b"]
  vpc_public_subnets = [
    "10.0.0.0/24",
    "10.0.1.0/24",
  ]
  sys_stage_vpc_id    = "vpc-a3d9d7c5"
  sys_stage_subnet_id = "subnet-040b206a1e260b0d2"

  tags = {
    "Project"     = "hyly"
    "Environment" = local.environment
    "Owner"       = "Terraform"
    "ManagedBy"   = "Junaid"
  }
}