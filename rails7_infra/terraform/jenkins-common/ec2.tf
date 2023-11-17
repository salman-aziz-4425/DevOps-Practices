module "ec2" {
  source              = "../modules/ec2/"
  project             = local.project
  region              = local.region
  ec2_ami_id          = data.aws_ami.ubuntu_22_04.id
  profile             = local.profile
  environment         = local.environment
  instance_type       = local.instance_type_jenkins
  allowed_ips_for_ssh = local.allowed_ips_for_ssh
  vpc_azs             = local.vpc_azs
  vpc_public_subnets  = local.vpc_public_subnets
  vpc_id              = local.sys_stage_vpc_id
  subnet_id           = local.sys_stage_subnet_id
}
