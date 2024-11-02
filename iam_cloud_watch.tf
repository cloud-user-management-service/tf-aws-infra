# resource "aws_iam_role" "cloudwatch_agent_role" {
#   name = "cloudwatchAgentRole"

#   assume_role_policy = jsonencode({
#     "Version" : "2012-10-17",
#     "Statement" : [
#       {
#         "Action" : "sts:AssumeRole",
#         "Effect" : "Allow",
#         "Principal" : {
#           "Service" : "ec2.amazonaws.com"
#         },
#         # "Sid": ""
#       }
#     ]
#   })
# }

# # resource "aws_iam_policy" "cloudwatch_agent_policy" {
# #   name   = "CloudWatchAgentPolicy"
# #   policy = jsonencode({
# #     "Version": "2012-10-17",
# #     "Statement": [
# #       {
# #         "Effect": "Allow",
# #         "Action": [
# #           "cloudwatch:PutMetricData",
# #           "logs:CreateLogStream",
# #           "logs:PutLogEvents",
# #           "logs:CreateLogGroup"
# #         ],
# #         "Resource": "*"
# #       }
# #     ]
# #   })
# # }

# resource "aws_iam_role_policy_attachment" "attach_cloudwatch_policy_false" {
#   role = aws_iam_role.cloudwatch_agent_role.name
#   #   policy_arn = aws_iam_policy.cloudwatch_agent_policy.arn
#   policy_arn = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
# }

# resource "aws_iam_role" "s3_access_role" {
#   name = "S3AccessRole"

#   assume_role_policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Effect = "Allow"
#         Principal = {
#           Service = "ec2.amazonaws.com"
#         }
#         Action = "sts:AssumeRole"
#       },
#     ]
#   })
# }

# resource "aws_iam_policy" "s3_access_policy" {
#   name        = "S3AccessPolicy"
#   description = "A policy to allow access to S3 buckets."

#   policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Effect = "Allow"
#         Action = [
#           "s3:ListBucket",
#           "s3:GetObject",
#           "s3:PutObject",
#           "s3:DeleteObject",
#         ]
#         Resource = [
#           aws_s3_bucket.my_bucket.arn,
#           "${aws_s3_bucket.my_bucket.arn}/*",
#         ]
#       },
#     ]
#   })
# }

# resource "aws_iam_role_policy_attachment" "attach_policy" {
#   policy_arn = aws_iam_policy.s3_access_policy.arn
#   role       = aws_iam_role.s3_access_role.name
# }

# Define the IAM policy for CloudWatch access
# resource "aws_iam_policy" "cloudwatch_agent_policy" {
#   name        = "cloudwatch_agent_policy"
#   description = "Iam role policy for EC2 to access CloudWatch"
#   policy = jsonencode({
#     Version = "2012-10-17",
#     Statement = [
#       {
#           "Effect" = "Allow",
#           "Action" = [
#               "logs:CreateLogGroup",
#               "logs:CreateLogStream",
#               "logs:PutLogEvents"
#           ],
#           "Resource" = "*"
#       }
#     ]
#   })
# }
