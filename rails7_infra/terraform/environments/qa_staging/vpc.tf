resource "aws_vpc" "qa_stage_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name        = "${local.project}-${local.environment}-vpc"
    Environment = "${local.environment}"
  }
}

resource "aws_subnet" "qa_stage_vpc_subnet" {
  vpc_id     = aws_vpc.qa_stage_vpc.id
  cidr_block = "10.0.0.0/24"

  tags = {
    Name        = "${local.project}-${local.environment}-subnet"
    Environment = "${local.environment}"
  }
}
