variable taskcount{}
resource "aws_ecs_service" "demo_service" {
  name            = "Sample Service"
  launch_type = "EC2"
  cluster         = aws_ecs_cluster.test_cluster.id
  task_definition = aws_ecs_task_definition.demo_task.arn
  desired_count   = var.taskcount
  force_new_deployment = true
  #iam_role        = aws_iam_role.foo.arn
  #depends_on      = [aws_iam_role_policy.foo]

  ordered_placement_strategy {
    type  = "binpack"
    field = "memory"
  }
  network_configuration{
    subnets = aws_subnet.private_subnet_1.id
    security_groups = aws_security_group.aws_ecs_sg.id
    assign_public_ip = false
  }
 load_balancer {
    target_group_arn = aws_lb_target_group.demo_tg.arn
    container_name   = "nginx"
    container_port   = 8080
  }
  tags{
    Name = "Infra Service"
  }
}