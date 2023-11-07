module "vpc" {
  source = "../../modules/vpc/"

  env             = local.environment
  azs             = local.vpc_azs
  public_subnets  = local.vpc_public_subnets
}
