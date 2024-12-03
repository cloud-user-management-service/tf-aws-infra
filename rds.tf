# Fetch the password from Secrets Manager to use for RDS
data "aws_secretsmanager_secret_version" "db_password" {
  secret_id  = aws_secretsmanager_secret.db_password.id
  depends_on = [aws_secretsmanager_secret_version.db_password_value]
}

# create a MySQL RDS instance
resource "aws_db_instance" "mysql_instance" {
  allocated_storage = 20
  engine            = "mysql"
  engine_version    = "8.0"
  instance_class    = "db.t3.medium"
  multi_az          = true # Do not create a multi-AZ deployment
  //DB instance identifier
  identifier          = var.db_identifier
  skip_final_snapshot = true
  username            = var.db_username
  password            = jsondecode(data.aws_secretsmanager_secret_version.db_password.secret_string)["password"]
  //subnet group
  db_subnet_group_name = aws_db_subnet_group.mysql_subnet_group.name
  publicly_accessible  = false # Do not expose to the internet
  //DB name
  db_name = var.db_name

  parameter_group_name   = aws_db_parameter_group.my_mysql_param_group.name
  vpc_security_group_ids = [aws_security_group.mysql_security_group.id]

  storage_encrypted = true
  kms_key_id        = aws_kms_key.rds_key.arn


  tags = {
    Name = "MySQL Instance"
  }
}
