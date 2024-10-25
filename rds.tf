# create a MySQL RDS instance
resource "aws_db_instance" "mysql_instance" {
  allocated_storage = 20
  engine            = "mysql"
  engine_version    = "8.0"
  instance_class    = "db.t3.micro"
  multi_az          = false
  //DB instance identifier
  identifier = "csye6225"
  username   = "csye6225"
  password   = var.db_password
  //subnet group
  db_subnet_group_name = aws_db_subnet_group.mysql_subnet_group.name
  publicly_accessible  = false # Do not expose to the internet
  //DB name
  db_name = "csye6225"

  parameter_group_name   = aws_db_parameter_group.my_mysql_param_group.name
  vpc_security_group_ids = [aws_security_group.mysql_security_group.id]


  tags = {
    Name = "MySQL Instance"
  }
}
