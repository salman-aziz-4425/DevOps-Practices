resource "aws_security_group" "qa_stage_security_group" {
  name        = "${var.project}-${var.environment}-sg"
  description = "Security group for ${var.environment} server"
  vpc_id      = data.aws_vpc.sys_stage_vpc.id
  ingress {
    description = "Allow SSH to qa_stage server"
    from_port   = "22"
    to_port     = "22"
    protocol    = "tcp"
    cidr_blocks = var.allowed_ips_for_ssh
  }
  egress {
    description = "Allow all outbound traffic"
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}