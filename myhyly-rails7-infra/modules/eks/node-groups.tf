resource "aws_eks_node_group" "this" {
  for_each = var.worker_nodes_node_groups

  cluster_name    = aws_eks_cluster.this.name
  node_group_name = each.key
  node_role_arn   = aws_iam_role.worker_nodes.arn

  subnet_ids = var.subnet_ids

  capacity_type  = each.value.capacity_type
  instance_types = each.value.instance_types
  launch_template {
       name    = aws_launch_template.launch_template[each.key].name
       version = aws_launch_template.launch_template[each.key].default_version
  }
  scaling_config {
    desired_size = each.value.scaling_config.desired_size
    max_size     = each.value.scaling_config.max_size
    min_size     = each.value.scaling_config.min_size
  }

  update_config {
    max_unavailable = 1
  }

  labels = {
    role = each.key
  }

  depends_on = [
    aws_iam_role_policy_attachment.worker_nodes,
    aws_launch_template.launch_template
  ]
}