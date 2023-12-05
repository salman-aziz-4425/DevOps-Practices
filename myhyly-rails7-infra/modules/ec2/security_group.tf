resource "aws_security_group" "security_group" {
  name        = "${var.project}-${var.environment}-sg"
  description = "Security group for ${var.environment} server"
  vpc_id      = data.aws_vpc.vpc.id
  ingress {
    description = "Allow SSH to qa_stage server"
    from_port   = "22"
    to_port     = "22"
    protocol    = "tcp"
    cidr_blocks = var.allowed_ips_for_ssh
  }
  ingress {
    description = "Allow all traffic through port 443 for https"
    from_port = "443"
    to_port = "443"
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "Allow all traffic through port 80 for http"
    from_port = "80"
    to_port = "80"
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    description = "Allow all outbound traffic"
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}