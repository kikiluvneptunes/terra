provider "aws" {
  region = "eu-west-1"
}

resource "aws_iam_user" "terraformi" {
  name = "TerraFormi"
  force_destroy = true
}

resource "aws_iam_user_login_profile" "terraformi" {
  user    = aws_iam_user.terraformi.name
  pgp_key = <<EOF
-----BEGIN PGP PUBLIC KEY BLOCK-----

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
EOF

  password_reset_required = false
}

resource "aws_iam_access_key" "terraformi" {
  user = aws_iam_user.terraformi.name
}

resource "aws_iam_policy" "terraformi_policy" {
  name        = "TerraformiFullInfraAccess"
  description = "Grants full access to required infrastructure resources"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "iam:CreateRole", "iam:DeleteRole", "iam:PassRole",
          "iam:CreatePolicy", "iam:DeletePolicy", "iam:GetPolicy", "iam:CreatePolicyVersion",
          "iam:AttachRolePolicy", "iam:DetachRolePolicy", "iam:AttachUserPolicy",
          "ec2:*",
          "elasticloadbalancing:*",
          "ecr:CreateRepository", "ecr:DeleteRepository", "ecr:PutLifecyclePolicy", "ecr:DescribeRepositories",
          "codebuild:*", "codepipeline:*"
        ],
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_user_policy_attachment" "terraformi_attachment" {
  user       = aws_iam_user.terraformi.name
  policy_arn = aws_iam_policy.terraformi_policy.arn
}

output "iam_username" {
  value = aws_iam_user.terraformi.name
}

output "console_password_encrypted" {
  value     = aws_iam_user_login_profile.terraformi.encrypted_password
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
