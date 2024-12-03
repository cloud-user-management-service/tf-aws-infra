# Define the IAM role for the EC2 instance
resource "aws_iam_role" "web_iam_role" {
  name = "EC2_web_iam_Role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole"
        Principal = {
          Service = "ec2.amazonaws.com"
        },
        Effect = "Allow",
        Sid    = ""
      }
    ]
  })
}

# Define the IAM policy for S3 access
resource "aws_iam_policy" "s3_iam_role_policy" {
  name        = "s3_iam_role_policy"
  description = "Iam role policy for EC2 to access S3 for user profile image"
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "s3:PutObject",
          "s3:GetObject",
          "s3:DeleteObject",
          "s3:ListBucket"
        ],
        Resource = [
          "${aws_s3_bucket.profile_image_bucket.arn}",
          "${aws_s3_bucket.profile_image_bucket.arn}/*"
        ]
      }
    ]
  })
}

//Define the IAM policy for sns topic access
resource "aws_iam_policy" "sns_iam_role_policy" {
  name = "sns_iam_role_policy"
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "sns:Publish",
        ],
        Resource = "*"
      }
    ]
  })
}


// Attach the IAM policy to the IAM role
resource "aws_iam_role_policy_attachment" "attach_s3_policy_to_role" {
  role       = aws_iam_role.web_iam_role.name
  policy_arn = aws_iam_policy.s3_iam_role_policy.arn
}

// attach the CloudWatchAgentAdminPolicy to the IAM role
resource "aws_iam_role_policy_attachment" "cloudwatch_policy" {
  role       = aws_iam_role.web_iam_role.name
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchAgentAdminPolicy"
}

// attach sns publish policy to the IAM role
resource "aws_iam_role_policy_attachment" "attach_sns_policy_to_role" {
  role       = aws_iam_role.web_iam_role.name
  policy_arn = aws_iam_policy.sns_iam_role_policy.arn
}

# Associate the IAM role with an EC2 instance profile
resource "aws_iam_instance_profile" "web_instance_profile" {
  name = "web_instance_profile"
  role = aws_iam_role.web_iam_role.name
}

# Define policy ec2 to access secrets manager
resource "aws_iam_policy" "secrets_manager_policy" {
  name = "secrets_manager_policy"
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "secretsmanager:GetSecretValue",
        ],
        Resource = aws_secretsmanager_secret.db_password.arn
      }
    ]
  })
}

# Attach the secrets manager policy to the IAM role
resource "aws_iam_role_policy_attachment" "attach_secrets_manager_policy_to_role" {
  role       = aws_iam_role.web_iam_role.name
  policy_arn = aws_iam_policy.secrets_manager_policy.arn
}