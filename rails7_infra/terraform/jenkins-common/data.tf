data "aws_ami" "ubuntu_22_04" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu-jammy-22.04"]
  }
  owners = ["self"]
}