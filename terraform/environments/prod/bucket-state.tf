module "bucket" {
  source                = "../../modules/backend"
  state_bucket_name     = local.staging_dev_state_bucket_name
  state_bucket_location = local.staging_dev_bucket_location
}