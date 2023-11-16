module "ec2" {
  source                 = "../../modules/ec2/"
  project                = local.project
  region                 = local.region
  profile                = local.profile
  environment            = local.environment
  instance_type_qa_stage = local.instance_type_qa_stage
  allowed_ips_for_ssh    = local.allowed_ips_for_ssh
  vpc_azs                = local.vpc_azs
  vpc_public_subnets     = local.vpc_public_subnets
  sys_stage_vpc_id       = local.sys_stage_vpc_id
  sys_stage_subnet_id    = local.sys_stage_subnet_id
}
