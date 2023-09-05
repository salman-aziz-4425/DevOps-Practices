terraform {
  required_version = ">= 1.4.6"

  backend "gcs" {
    bucket      = "ml-prod-state"
    prefix      = "terraform/state"
    credentials = "~/.creds/terraform-credentials.json"
  }

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.23"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.23.0"
    }
    mongodbatlas = {
      source  = "mongodb/mongodbatlas"
      version = "1.11.0"
    }
  }
}

provider "google" {
  credentials = file("~/.creds/terraform-credentials.json")
  project     = local.project
  region      = local.region
}
provider "kubernetes" {
  host                   = "https://${module.gke.endpoint}"
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(module.gke.ca_certificate)
}
provider "mongodbatlas" {
  public_key  = data.google_secret_manager_secret_version.atlas_public_key.secret_data
  private_key = data.google_secret_manager_secret_version.atlas_private_key.secret_data
}