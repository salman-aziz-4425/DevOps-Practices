# Bucket module
resource "google_storage_bucket" "vpc_state_bucket" {
  name   = var.vpc_state_bucket_name
  location = var.vpc_state_bucket_location
}