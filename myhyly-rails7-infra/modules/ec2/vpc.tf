data "aws_vpc" "vpc" {
  id = var.vpc_id
}
data "aws_subnet" "subnet" {
  id = var.subnet_id
}

