// Create a lambda function to verify email
resource "aws_lambda_function" "email_verification_lambda" {
  function_name = "email_verification_lambda_funciton"
  filename      = var.lambda_zip_file
  handler       = "index.handler"
  role          = aws_iam_role.lambda_iam_role.arn
  runtime       = "nodejs16.x"
  timeout       = 300 // seconds
  vpc_config {
    subnet_ids         = [aws_subnet.csye6225_private_subnet_1.id]
    security_group_ids = [aws_security_group.lambda_sg.id]
  }
  environment {
    variables = {
      RDS_HOST         = aws_db_instance.mysql_instance.address
      RDS_PORT         = aws_db_instance.mysql_instance.port
      RDS_NAME         = var.db_name
      RDS_USER         = var.rds_username
      RDS_PASSWORD     = var.rds_password
      SENDGRID_API_KEY = var.sendgrid_api_key
      EMAIL_FROM       = var.email_from
      BASE_URL         = var.base_url
    }
  }
}

// Add permission to lambda function to allow SNS to invoke the function
resource "aws_lambda_permission" "allow_sns" {
  statement_id  = "AllowExecutionFromSNS"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.email_verification_lambda.function_name
  principal     = "sns.amazonaws.com"
  source_arn    = aws_sns_topic.email_verification_topic.arn
}

