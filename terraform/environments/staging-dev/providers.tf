terraform {
  required_version = ">= 1.4.6"
  backend "gcs" {
    bucket      = "staging-dev-state"
    prefix      = "terraform/state"
    credentials = "~/.creds/terraform-credentials.json"
  }
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.23"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "4.81.0"
    }
  }
}

provider "google" {
  credentials = file("~/.creds/terraform-credentials.json")
  project     = local.project
  region      = local.region
}
provider "google-beta" {
  credentials = file("~/.creds/terraform-credentials.json")
  project     = local.project
  region      = local.region
}