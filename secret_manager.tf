# Auto-generate database password
resource "random_password" "db_password" {
  length           = var.db_password_length
  special          = true
  override_special = "!#$%^&*()-_=+[]{}<>?"
}

# Store database password in Secrets Manager
resource "aws_secretsmanager_secret" "db_password" {
  name       = var.db_password_secret_name
  kms_key_id = aws_kms_key.secrets_manager_key.arn
}

resource "aws_secretsmanager_secret_version" "db_password_value" {
  secret_id = aws_secretsmanager_secret.db_password.id
  secret_string = jsonencode({
    password = random_password.db_password.result
  })
}

# Create a secret for email service credentials
resource "aws_secretsmanager_secret" "email_service_secret" {
  name        = var.email_service_secret_name
  description = "Credentials for the email service used by Lambda"
  kms_key_id  = aws_kms_key.secrets_manager_key.arn
}

# Store the secret value (replace with actual values during deployment)
resource "aws_secretsmanager_secret_version" "email_service_secret_value" {
  secret_id = aws_secretsmanager_secret.email_service_secret.id
  secret_string = jsonencode({
    password = var.sendgrid_api_key
  })
}
