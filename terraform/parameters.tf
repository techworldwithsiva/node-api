data "aws_ssm_parameter" "vpc_id" {
  name = "/toptal/vpc/vpc_id"
}

data "aws_ssm_parameter" "api_security_group_id" {
  name = "/toptal/api-alb/security_group_id"
}

data "aws_ssm_parameter" "rds_security_group_id" {
  name = "/toptal/rds/security_group_id"
}

data "aws_ssm_parameter" "rds_secret_arn" {
  name = "/toptal/rds/rds_secret_arn"
}

data "aws_ssm_parameter" "rds_endpoint" {
  name = "/toptal/rds/rds_endpoint"
}

data "aws_ssm_parameter" "ecs_cluster_id" {
  name = "/toptal/ecs/ecs_cluster_id"
}

data "aws_ssm_parameter" "api_target_group_arn" {
  name = "/toptal/alb/api_target_group_arn"
}

data "aws_ssm_parameter" "private_subnets" {
  name = "/toptal/vpc/private_subnets"
}