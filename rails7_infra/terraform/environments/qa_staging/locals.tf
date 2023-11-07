locals {
  project     = "myhyly"
  region      = "us-east-1"
  profile     = "246071984618_Terraform"
  environment = "qa-stage"
  instance_type_qa_stage = "m7.medium"

  allowed_ips_for_ssh = [
    "14.237.225.29/32", # Tin IP
    "122.129.66.106/32" # Junaid IP
  ]

  vpc_azs = ["us-east-2a", "us-east-2b"]
  vpc_public_subnets = [
    "10.0.0.0/24",
    "10.0.1.0/24"
  ]

  tags = {
    "Project"     = "hyly"
    "Environment" = local.environment
    "Owner"       = "Terraform"
    "ManagedBy"   = "Junaid"
  }
}