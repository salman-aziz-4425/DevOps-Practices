# Bucket creation from project by calling the modules
module "bucket" {
  source                    = "../modules/backend"
  vpc_state_bucket_name     = local.vpc_state_bucket_name
  vpc_state_bucket_location = local.vpc_state_bucket_location
}
