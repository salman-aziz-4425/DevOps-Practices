# Bucket creation from project by calling the modules
module "bucket" {
  source                = "../modules/backend"
  state_bucket_name     = local.vpc_state_bucket_name
  state_bucket_location = local.vpc_state_bucket_location
}
