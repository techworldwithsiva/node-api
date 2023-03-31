data "aws_iam_policy_document" "ecs_trust" {
  statement {
    actions = ["sts:AssumeRole"]
    sid     = "ECSAssumeRole"
    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "rds_secret" {
  statement {
    sid = "AllowECSTask"
    actions = [
      "secretsmanager:GetSecretValue"
    ]
    resources = ["${local.rds_secret_arn}"]
  }
}
data "aws_region" "current" {}