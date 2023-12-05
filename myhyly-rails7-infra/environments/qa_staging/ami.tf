resource "aws_ami_copy" "ubuntu_jammy" {
  name              = "ubuntu-jammy-22.04"
  description       = "Ubuntu 22.04 LTS AMI"
  source_ami_id     = "ami-0b2a9065573b0a9c9"
  source_ami_region = "us-east-1"
}