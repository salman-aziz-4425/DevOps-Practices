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




