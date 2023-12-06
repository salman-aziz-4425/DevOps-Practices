module "ecr" {
  source   = "../../modules/ecr"
  for_each = local.repositories

  name                  = each.key
  environment           = each.value.environment
  image_tag_mutability  = each.value.image_tag_mutability
  scan_on_push          = each.value.scan_on_push
  expiration_after_days = each.value.expiration_after_days
  retain_minimum_images = each.value.retain_minimum_images
  additional_tags       = each.value.tags
  attach_policy_to_ecr  = each.value.attach_policy_to_ecr
}


module "ec2" {
  source                  = "../../modules/ec2/"
  project                 = local.project
  region                  = local.region
  ec2_ami_id              = aws_ami_copy.ubuntu_jammy.id
  profile                 = local.profile
  environment             = local.environment
  instance_type           = local.instance_type_qa_stage
  allowed_ips_for_ssh     = local.allowed_ips_for_ssh
  vpc_azs                 = local.vpc_azs
  vpc_public_subnets      = local.vpc_public_subnets
  vpc_id                  = local.sys_stage_vpc_id
  subnet_id               = local.sys_stage_subnet_id
  ec2_server_iam_policies = local.app_ec2_server_iam_policies
}
