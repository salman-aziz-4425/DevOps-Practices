resource "aws_security_group" "qa_stage_security_group" {
  name        = "${local.project}-${local.environment}-sg"
  description = "Security group for ${local.environment} server"
  vpc_id      = aws_vpc.qa_stage_vpc.id

  ingress {
    description = "Allow SSH to Jenkins server"
    from_port   = "22"
    to_port     = "22"
    protocol    = "tcp"
    cidr_blocks = local.allowed_ips_for_ssh
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${local.project}-${local.environment}-sg"
    Environment = local.environment
  }
}