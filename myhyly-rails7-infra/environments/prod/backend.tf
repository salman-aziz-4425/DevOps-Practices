terraform {
  backend "s3" {
    bucket  = "hyly-beta-prod-backend"
    key     = "terraform.state"
    region  = "us-east-1"
    encrypt = true
  }
}