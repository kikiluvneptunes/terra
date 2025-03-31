provider "aws" {
  region = "eu-west-1"
}

# Create IAM user
resource "aws_iam_user" "terraformi" {
  name = "TerraFormi"
  force_destroy = true
}

# Set console login password
resource "aws_iam_user_login_profile" "terraformi" {
  user     = aws_iam_user.terraformi.name
  password = "TerraFormi123!@"
  password_reset_required = true
}

# Create access keys
resource "aws_iam_access_key" "terraformi" {
  user = aws_iam_user.terraformi.name
}

# Create IAM policy with required permissions
resource "aws_iam_policy" "terraformi_policy" {
  name        = "TerraformiFullInfraAccess"
  description = "Grants full access to required infrastructure resources"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          # IAM
          "iam:CreateRole", "iam:DeleteRole", "iam:PassRole",
          "iam:CreatePolicy", "iam:DeletePolicy", "iam:GetPolicy", "iam:CreatePolicyVersion",
          "iam:AttachRolePolicy", "iam:DetachRolePolicy", "iam:AttachUserPolicy",

          # EC2 & Networking
          "ec2:*",

          # Elastic Load Balancer
          "elasticloadbalancing:*",

          # ECR
          "ecr:CreateRepository", "ecr:DeleteRepository", "ecr:PutLifecyclePolicy", "ecr:DescribeRepositories",

          # CodeBuild & CodePipeline
          "codebuild:*", "codepipeline:*"
        ],
        Resource = "*"
      }
    ]
  })
}

# Attach policy to user
resource "aws_iam_user_policy_attachment" "terraformi_attachment" {
  user       = aws_iam_user.terraformi.name
  policy_arn = aws_iam_policy.terraformi_policy.arn
}

output "iam_username" {
  value = aws_iam_user.terraformi.name
}

output "console_password" {
  value     = aws_iam_user_login_profile.terraformi.password
  sensitive = true
}

output "access_key_id" {
  value     = aws_iam_access_key.terraformi.id
  sensitive = true
}

output "secret_access_key" {
  value     = aws_iam_access_key.terraformi.secret
  sensitive = true
}
