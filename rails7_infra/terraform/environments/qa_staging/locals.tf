locals {
  project     = "myhyly"
  region      = "us-east-1"
  profile     = "246071984618_Terraform"
  environment = "qa-stage"

  key_name      = "tn-keypair"
  instance_role = "arn:aws:iam::246071984618:role/ec2-system-manager-ssm-integration"

  allowed_ips_for_ssh = [
    "14.237.225.29/32", # Tin IP
    "122.129.66.106/32" # Junaid IP
  ]

  tags = {
    "Project"     = "hyly"
    "Environment" = local.environment
    "Owner"       = "Terraform"
    "ManagedBy"   = "Junaid"
  }
}