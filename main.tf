module "memory_db" {
  source = "terraform-aws-modules/memory-db/aws"

  # Cluster
  name        = "akshay-example"
  description = "Example MemoryDB cluster"

  engine_version             = "6.2"
  auto_minor_version_upgrade = true
  node_type                  = "db.t4g.small"
  num_shards                 = 2
  num_replicas_per_shard     = 2

  tls_enabled              = true
  security_group_ids       = ["sg-080e354c5215ebe1d"]
#   maintenance_window       = "sun:23:00-mon:01:30"
#   sns_topic_arn            = "arn:aws:sns:us-east-1:012345678910:example-topic"
#   snapshot_retention_limit = 7
#   snapshot_window          = "05:00-09:00"

  # Users
#   users = {
#     admin = {
#       user_name     = "admin-user"
#       access_string = "on ~* &* +@all"
#       passwords     = ["YouShouldPickAStrongSecurePassword987!"]
#       tags          = { User = "admin" }
#     }
#     readonly = {
#       user_name     = "readonly-user"
#       access_string = "on ~* &* -@all +@read"
#       passwords     = ["YouShouldPickAStrongSecurePassword123!"]
#       tags          = { User = "readonly" }
#     }
#   }

  # ACL
#   acl_name = "example-acl"
#   acl_tags = { Acl = "custom" }

#   # Parameter group
  parameter_group_name        = "example-param-group"
  parameter_group_description = "Example MemoryDB parameter group"
  parameter_group_family      = "memorydb_redis6"
  parameter_group_parameters = [
    {
      name  = "activedefrag"
      value = "yes"
    }
  ]
  parameter_group_tags = {
    ParameterGroup = "custom"
  }

#   # Subnet group
#   subnet_group_name        = "example-subnet-group"
#   subnet_group_description = "Example MemoryDB subnet group"
  subnet_ids               = ["subnet-058af724303d14b59","subnet-0317bf250af3111e4"]
#   subnet_group_tags = {
#     SubnetGroup = "custom"
#   }

#   tags = {
#     Terraform   = "true"
#     Environment = "dev"
#   }
}