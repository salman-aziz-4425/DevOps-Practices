module "vpc" {
  source          = "./modules/vpc"
  vpc_id          = var.vpc_id
  cluster-name    = "myhyly-${terraform.workspace}-eks-cluster"
  cluster-version = var.cluster-version
  azs             = var.azs
  region          = var.aws_region
  vpc-cidr-prefix = var.vpc-cidr-prefix
  igw_id          = var.igw_id

}

