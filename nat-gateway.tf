resource "aws_eip" "elastic_ip" {
  domain   = "vpc"

}
resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.elastic_ip.id
  subnet_id     = aws_subnet.private_subnet_1.id

  tags = {
    Name = "NAT Gateway"
  }
}
