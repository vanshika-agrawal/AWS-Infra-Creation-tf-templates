resource "aws_instance" "ec2_ecs_cluster"{
instance_type = 
subnet_id= aws_subnet.private_subnet_1.id
availability_zone= 
key_name = 
user_data= <<-EOF
    #!/bin/bash
    echo ECS_CLUSTER=${aws_ecs_cluster.cluster.name} >> /etc/ecs/ecs.config
  EOF

iam_instance_profile = aws_iam_instance_profile.ecs_instance_profile.name
security_groups = [aws_security_group.ecs_sg.id]
tags = {
    name = ECS-EC2 instance
}
}
resource "aws_security_group" "ecs_sg"{
name = "aws_ecs_sg"
vpc_id = aws_default_vpc.main.id
tags ={
    Name = AWS ecs sg
}
}