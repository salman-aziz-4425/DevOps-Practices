data "aws_eks_cluster_auth" "cluster_auth" {
  name = aws_eks_cluster.this.name
}

provider "kubernetes" {
  host                   = aws_eks_cluster.this.endpoint
  cluster_ca_certificate = base64decode(aws_eks_cluster.this.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.cluster_auth.token
}

resource "kubernetes_config_map" "aws_auth_configmap" {
  metadata {
    name      = "aws-auth"
    namespace = "kube-system"
  }
  data = {
    mapRoles = <<YAML
- groups:
  - system:bootstrappers
  - system:nodes
  rolearn: ${aws_iam_role.worker_nodes.arn}
  username: system:node:{{EC2PrivateDNSName}}
YAML
    mapUsers = <<YAML
${join("\n\n", [
    for user_arn in var.kubectl_roles : "- groups:\n  - system:masters\n  userarn: ${user_arn}\n  username: ${split("/", user_arn)[length(split("/", user_arn)) - 1]}"
])}
YAML
}
}
