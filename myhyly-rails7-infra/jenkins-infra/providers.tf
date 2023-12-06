terraform {
  required_version = ">= 1.4.6"

  backend "s3" {
    bucket         = "jenkins-hyly-remote-state"
    key            = "jenkins-hyly/jenkins-hyly-terraform.tfstate"
    dynamodb_table = "jenkins-hyly-state-locking"
    encrypt        = true
    region         = "us-east-1"
    profile        = "246071984618_Terraform"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.66"
    }
  }
}

provider "aws" {
  region  = local.region
  profile = local.profile

  default_tags {
    tags = local.tags
  }
}

