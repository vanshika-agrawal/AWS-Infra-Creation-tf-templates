resource "aws_instance" "ec2_ecs_cluster"{
instance_type = "t3a.small"
subnet_id= aws_subnet.private_subnet_1.id
availability_zone= "us-west-2a"
key_name = "deployer_key"
user_data= <<-EOF
    #!/bin/bash
    echo ECS_CLUSTER=${aws_ecs_cluster.pseudo_cluster.name} >> /etc/ecs/ecs.config
  EOF

iam_instance_profile = aws_iam_instance_profile.ecs_instance_profile.name
security_groups = [aws_security_group.ecs_sg.id]
tags = {
    name = "ECS-EC2-instance"
}
}

resource "tls_private_key" "tls_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  }
