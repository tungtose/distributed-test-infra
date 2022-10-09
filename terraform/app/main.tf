data "aws_partition" "current" {}

locals {
  name            = "distributed-test-${var.environment}"
  cluster_version = "1.23"
  region          = var.region
  partition       = data.aws_partition.current.partition

  tags = {
    Name        = "distributed-test-${var.environment}"
    Environment = var.environment
  }
}
