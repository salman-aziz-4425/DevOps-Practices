# Bucket module
resource "google_storage_bucket" "state_bucket" {
  name   = var.state_bucket_name
  location = var.state_bucket_location
}