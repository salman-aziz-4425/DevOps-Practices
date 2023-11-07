data "aws_vpc" "sys_stage_vpc" {
  id = local.sys_stage_vpc_id
}

data "aws_subnet" "sys_stage_subnet" {
  id = local.sys_stage_subnet_id
}

