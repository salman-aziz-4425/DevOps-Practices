locals{

  aws_region        = "us-east-1"
  vpc_id            = "vpc-03003cff6bdf69b3b"
  subnet_ids        = ["subnet-0425c55010feeb39a","subnet-0c9f3b892d8274323"]
  azs               = ["us-east-1d","us-east-1e"]
  vpc-cidr-prefix   = "10.0"
  igw_id            = "igw-0ce0d599510465b45"
  cluster-version   = "1.28"

  
  # App EKS module values
  app_enable_cluster_autoscaler = true
  app_worker_nodes_iam_policies = {
    1 = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
    2 = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
    3 = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
    4 = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  }
  app_enable_irsa = true
  app_worker_nodes_node_groups = {
    "public-nodes-on-demand" = {
      capacity_type  = "ON_DEMAND"
      instance_types = ["c5n.large"] # replace correct type after testing
      disk_size      = 80            # replace correct storage for app after instnaces testing
      scaling_config = {
        desired_size = 0
        max_size     = 2
        min_size     = 0
      }
    },
    "public-nodes-spot" = {
      capacity_type  = "SPOT"
      instance_types = ["c5n.large"] # replace correct type after testing
      disk_size      = 80            # replace correct storage for app after instnaces testing
      scaling_config = {
        desired_size = 0
        max_size     = 2
        min_size     = 0
      }
    }
  }
  app_kubectl_roles = [
    "arn:aws:iam::246071984618:user/246071984618_Terraform",
    "arn:aws:iam::246071984618:user/junaid",
    "arn:aws:iam::246071984618:user/tn@hy.ly"
    # Add additional users to connect to the EKS cluster
    # "<user_arn>"
  ]
  app_enable_metric_server = true
}


