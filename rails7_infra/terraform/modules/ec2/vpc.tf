data "aws_vpc" "sys_stage_vpc" {
  id = var.sys_stage_vpc_id
}

data "aws_subnet" "sys_stage_subnet" {
  id = var.sys_stage_subnet_id
}

