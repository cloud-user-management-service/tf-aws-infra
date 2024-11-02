resource "aws_db_parameter_group" "my_mysql_param_group" {
  name        = "custom-mysql-param-group"
  family      = "mysql8.0"
  description = "Custom parameter group for MySQL 8.0"


}
