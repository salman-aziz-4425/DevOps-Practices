# Bucket creation from project by calling the modules
module "bucket" {
  source                = "../modules/backend"
  state_bucket_name     = local.jenkins_state_bucket_name
  state_bucket_location = local.jenkins_bucket_location
}