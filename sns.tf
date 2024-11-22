resource "aws_sns_topic" "email_verification_topic" {
  name = "email_verification_topic"
}

// Create a subscription for the email_verification_topic to the email_verification_lambda
resource "aws_sns_topic_subscription" "my_sns_subscription" {
  topic_arn = aws_sns_topic.email_verification_topic.arn
  protocol  = "lambda"
  endpoint  = aws_lambda_function.email_verification_lambda.arn
}

