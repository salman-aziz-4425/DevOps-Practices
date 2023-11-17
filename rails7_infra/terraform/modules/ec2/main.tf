resource "aws_instance" "ec2_server" {
  ami           = var.ec2_ami_id
  subnet_id     = data.aws_subnet.subnet.id
  instance_type = var.instance_type

  key_name        = data.aws_key_pair.ja-keypair.key_name
  vpc_security_group_ids = [aws_security_group.security_group.id]

  root_block_device {
    volume_size = 150
    volume_type = "gp3"
  }
  tags = {
    Name        = "app-${var.project}-${var.environment}"
  }
  depends_on = [aws_security_group.security_group]
}
resource "aws_eip" "server_eip" {
  instance = aws_instance.ec2_server.id
}