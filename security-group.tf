resource "aws_security_group" "ecs_sg"{
name = "aws_ecs_sg"
vpc_id = aws_default_vpc.main.id
tags ={
    Name = "AWS-ecs-sg"
}
resource "aws_vpc_security_group_ingress_rule" "inbound_sg_http" {
  security_group_id = aws_security_group.ecs_sg.id
  from_port   = 80
  ip_protocol = "tcp"
  to_port     = 80
}

}
resource "aws_vpc_security_group_ingress_rule" "outbound_sg_https" {
  security_group_id = aws_security_group.ecs_sg.id
  ip_protocol = -1
}