variable "aws_region" {
  type        = string
  description = "AWS Region"
  nullable    = false
}

variable "vpc_id" {
  type        = string
  description = "Rails 4 VPC SYS Production"
  nullable    = false
}

variable "subnet_ids" {
  description = "Subnet Ids for node groups."
  type        = list(string)
}


variable "azs" {
  type        = list(string)
  description = "List of Availability Zones"
  nullable    = false
}

variable "vpc-cidr-prefix" {
  type        = string
  description = "VPC-CIDR-Prefix"
  nullable = false
}

variable "igw_id" {
  type        = string
  description = "Internet Gateway ID"
  nullable    = false
}

variable "cluster_name" {
  description = "Name of the cluster."
  type        = string
}
variable "cluster_version" {
  description = "Desired Kubernetes master version."
  type        = string
}
variable "worker_nodes_iam_policies" {
  description = "List of IAM Policies to attach to EKS-managed nodes."
  type        = map(any)
  default = {
    1 = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
    2 = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
    3 = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
    4 = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  }
}
variable "enable_cluster_autoscaler" {
  description = "Determines whether to deploy cluster autoscaler"
  type        = bool
  default     = false
}
variable "enable_irsa" {
  description = "Determines whether to create an OpenID Connect Provider for EKS to enable IRSA"
  type        = bool
  default     = true
}
variable "ebs_delete_on_termination" {
  description = "Delete on termination for EBS volumes"
  type        = bool
  default     = true
}
variable "worker_nodes_node_groups" {
  description = "EKS public worker nodes node groups"
  type        = map(any)
}
variable "kubectl_roles" {
  description = "IAM roles to connect to EKS cluster"
  type        = list(string)
  default     = []
}
variable "enable_metric_server" {
  description = "Enable metric server"
  type        = bool
  default     = false
}