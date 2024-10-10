resource "aws_ecs_cluster" "pseudo_cluster" {
  name = "example"
  tags =
  {
    Name = "Test Infra Cluster"
  }
  log_configuration {
        cloud_watch_encryption_enabled = true
        cloud_watch_log_group_name     = aws_cloudwatch_log_group.test_cluster.name
      }
}
