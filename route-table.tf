variable "vpc_id" {}
resource "aws_default_route_table" "public_route_table" {
  default_route_table_id = aws_vpc.public_route_table.default_route_table_id

  route {
    cidr_block = "10.0.1.0/24"
    gateway_id = aws_internet_gateway.default_ig.id
  }

  route {
    ipv6_cidr_block        = "::/0"
    egress_only_gateway_id = aws_egress_only_internet_gateway.default_eig.id
  }

  tags = {
    Name = "public route table"
  }
}

data "aws_internet_gateway" "default_ig" {
  filter {
    name   = "attachment.vpc-id"
    values = [var.vpc_id]
  }
}

data "aws_egress_only_internet_gateway" "default_eig" {
  vpc_id = aws_vpc.example.id

  tags = {
    Name = "elastic Ip"
  }
}
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "10.0.1.0/24"
    gateway_id = aws_internet_gateway.example.id
  }

  route {
    ipv6_cidr_block        = "::/0"
    egress_only_gateway_id = aws_egress_only_internet_gateway.example.id
  }

  tags = {
    Name = "example"
  }
}