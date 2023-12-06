data "aws_vpc" "main" {
  id = var.vpc_id
}


resource "aws_subnet" "main" {
  count             = 2
  availability_zone = var.azs[count.index]
  cidr_block        = "${var.vpc-cidr-prefix}.${count.index + 3}.0/24"
  vpc_id            = data.aws_vpc.main.id

  map_public_ip_on_launch = true
}


data "aws_internet_gateway" "main" {
  internet_gateway_id = var.igw_id
}


resource "aws_route_table" "main" {
  vpc_id = data.aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = data.aws_internet_gateway.main.id
  }

}

resource "aws_route_table_association" "main" {
  count          = 2
  subnet_id      = aws_subnet.main.*.id[count.index]
  route_table_id = aws_route_table.main.id
}