resource "aws_instance" "qa_stage_server" {
  name          = "app-${local.project}-${local.environment}"
  ami           = data.aws_ami.ubuntu.id
  instance_type = "m7.medium"

  vpc_id = aws_vpc.qa_stage_vpc.id

  key_name             = data.aws_key_pair.ja-keypair
  iam_instance_profile = local.instance_role
  security_groups      = aws_security_group.qa_stage_security_group

  root_block_device = {
    volume_size = 32
  }
  ebs_block_device = {
    volume_size = 150
  }

  tags = {
    Name        = "app-${local.project}-${local.environment}"
    Environment = local.environment
  }
}

resource "aws_eip" "qa_stage_server_eip" {
  instance = aws_instance.qa_stage_server
  domain   = "vpc"
}