terraform {
  required_version = ">= 1.4.6"
  backend "gcs" {
    bucket      = "vpc-state"
    prefix      = "terraform/state"
    credentials = "~/.creds/terraform-credentials.json"
  }
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.23"
    }
    google-beta = {
      version = "~> 4.23"
    }
  }
}

provider "google" {
  credentials = file("~/.creds/terraform-credentials.json")
  project     = local.project
  region      = local.region
}

provider "google-beta" {
  alias       = "google-beta"
  credentials = file("~/.creds/terraform-credentials.json")
  project     = local.project
  region      = local.region
}