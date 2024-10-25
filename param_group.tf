resource "aws_db_parameter_group" "my_mysql_param_group" {
  name        = "custom-mysql-param-group"
  family      = "mysql8.0"
  description = "Custom parameter group for MySQL 8.0"

  #   parameter {
  #     name  = "max_connections"
  #     value = "100"
  #   }

  #   parameter {
  #     name  = "log_queries_not_using_indexes"
  #     value = "1"
  #   }
}
