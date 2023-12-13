module "eks" {
  source                   = "../../modules/eks"
  vpc_id                   = local.vpc_id
  subnet_ids               = local.subnet_ids
  aws_region               = local.aws_region
  cluster_name             = "myhyly-${terraform.workspace}-eks-cluster"
  cluster_version          = local.cluster-version
  azs                      = local.azs
  vpc-cidr-prefix          = local.vpc-cidr-prefix
  igw_id                   = local.igw_id
  worker_nodes_node_groups = local.app_worker_nodes_node_groups

}

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