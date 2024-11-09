

# Define the IAM role for S3 access
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
resource "aws_iam_policy" "web_iam_role_policy" {
  name        = "web_iam_role_policy"
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


# Attach the policy to the IAM role
resource "aws_iam_role_policy_attachment" "attach_s3_policy_to_role" {
  role       = aws_iam_role.web_iam_role.name
  policy_arn = aws_iam_policy.web_iam_role_policy.arn
}

resource "aws_iam_role_policy_attachment" "attach_cloudwatch_policy" {
  role = aws_iam_role.web_iam_role.name
  #   policy_arn = aws_iam_policy.cloudwatch_agent_policy.arn
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchAgentAdminPolicy"
}

# Associate the IAM role with an EC2 instance profile
resource "aws_iam_instance_profile" "web_instance_profile" {
  name = "web_instance_profile"
  role = aws_iam_role.web_iam_role.name
}

