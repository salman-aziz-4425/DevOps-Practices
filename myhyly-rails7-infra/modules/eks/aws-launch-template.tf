resource "aws_launch_template" "launch_template" {
  for_each               = var.worker_nodes_node_groups
  name                   = "ebs-${each.key}-launch-template"
  description            = "Launch Template for Skipping delete on termination of EBS"
  ebs_optimized          = true
  update_default_version = false

  block_device_mappings {
    device_name = "/dev/xvda"
    ebs {
      volume_type           = "gp3"
      volume_size           = each.value.disk_size
      delete_on_termination = var.ebs_delete_on_termination
    }
  }
}