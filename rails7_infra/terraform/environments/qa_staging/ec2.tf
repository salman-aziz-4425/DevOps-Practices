resource "aws_instance" "qa_stage_server" {
  ami           = data.aws_ami.ubuntu.id
  subnet_id     = data.aws_subnet.sys_stage_subnet.id
  instance_type = local.instance_type_qa_stage

  key_name        = data.aws_key_pair.ja-keypair.key_name
  vpc_security_group_ids = [aws_security_group.qa_stage_security_group.id]

  root_block_device {
    volume_size = 150
    volume_type = "gp3"
  }
  tags = {
    Name        = "app-${local.project}-${local.environment}"
  }
  depends_on = [aws_security_group.qa_stage_security_group]
}
resource "aws_eip" "qa_stage_server_eip" {
  instance = aws_instance.qa_stage_server.id
}