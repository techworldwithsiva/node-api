locals {
  name   = "toptal-api"
  region = "ap-south-1"
  tags = {
    Terraform   = "true"
    Environment = "PROD"
    System      = "toptal"
    Component   = "api"
    Type        = "infra"
  }
  env_vars_api = [
    {
      "name" : "DBUSER",
      "value" : "developer"
    },
    {
      "name" : "DB",
      "value" : "node_app"
    },
    {
      "name" : "DBHOST",
      "value" : "${local.rds_endpoint}"
    },
    {
      "name" : "DBPORT",
      "value" : "5432"
    }
  ]
  application_secrets = [
    {
      "name" : "DBPASS"
      "valueFrom" : "${local.rds_secret_arn}"
    }
  ]
}
locals {
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  api_security_group_id = data.aws_ssm_parameter.api_security_group_id.value
  rds_security_group_id = data.aws_ssm_parameter.rds_security_group_id.value
  rds_secret_arn = data.aws_ssm_parameter.rds_secret_arn.value
  rds_endpoint = data.aws_ssm_parameter.rds_endpoint.value
  ecs_cluster_id = data.aws_ssm_parameter.ecs_cluster_id.value
  api_target_group_arn = data.aws_ssm_parameter.api_target_group_arn.value
  private_subnets = split(",", data.aws_ssm_parameter.private_subnets.value)[0]
}