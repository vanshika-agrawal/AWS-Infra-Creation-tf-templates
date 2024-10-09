variable "vpc_id" {}
data "aws_vpc" "default_vpc" {
  id = var.vpc_id
}
#Public Subnets for AZ - 2a, 2b, 2c
resource "aws_default_subnet" "public_subnet_1" {
  availability_zone = "us-west-2a"
  tags = {
    Name = "public subnet for us-west-2a"
  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-west-2b"
  tags = {
    Name = "public subnet for us-west-2b"
  }
}

resource "aws_subnet" "public_subnet_3" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-west-2c"
  tags = {
    Name = "public subnet for us-west-2c"
  }
}

#Private Subnets for AZ - 2a, 2b, 2c
resource "aws_subnet" "private_subnet_1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-west-2a"
  tags = {
    Name = "private subnet for us-west-2a"
  }
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-west-2b"
  tags = {
    Name = "private subnet for us-west-2b"
  }
}

resource "aws_subnet" "private_subnet_3" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-west-2c"
  tags = {
    Name = "private subnet for us-west-2c"
  }
}