locals {
  project                = "myhyly"
  region                 = "us-east-1"
  profile                = "246071984618_Terraform"
  environment            = "qa-stage"
  instance_type_qa_stage = "m7i.large"

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

  # ECR locals
  repositories = {
    "hylybe_qa" = {
      image_tag_mutability  = "MUTABLE"
      scan_on_push          = true
      expiration_after_days = 30
      retain_minimum_images = 10
      environment           = "qa"
      tags = {
        Project     = "myhyly"
        Owner       = "junaid"
        Purpose     = "hyly-be-qa-images"
        Description = "For hyly-be deployment"
      }
    }
    "hylybe_stg" = {
      image_tag_mutability  = "MUTABLE"
      scan_on_push          = true
      expiration_after_days = 30
      retain_minimum_images = 10
      environment           = "staging"
      tags = {
        Project     = "myhyly"
        Owner       = "junaid"
        Purpose     = "hyly-be-stg-images"
        Description = "For hyly-be deployment"
      }
    }
  }

  tags = {
    "Project"     = "hyly"
    "Environment" = local.environment
    "Owner"       = "Terraform"
    "ManagedBy"   = "Junaid"
  }
}