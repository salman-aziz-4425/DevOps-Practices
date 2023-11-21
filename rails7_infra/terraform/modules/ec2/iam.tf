resource "aws_iam_role" "ec2_server" {
  name = "${var.environment}-${var.project}"

  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
    Version = "2012-10-17"
  })
}
resource "aws_iam_role_policy_attachment" "ec2_server" {
  for_each = var.ec2_server_iam_policies

  policy_arn = each.value
  role       = aws_iam_role.ec2_server.name
}