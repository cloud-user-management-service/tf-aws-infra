# create a MySQL RDS instance
resource "aws_db_instance" "mysql_instance" {
  allocated_storage    = 20
  engine         = "mysql"
  engine_version = "8.0"
  instance_class = "db.t3.micro" # Cheapest instance type
  multi_az       = false         # Do not create a multi-AZ deployment
  //DB instance identifier
  identifier = "csye6225"
  username   = "csye6225"
  password   = var.db_password # Strong password defined in variables
  # data.aws_ssm_parameter.db_password.value
  //subnet group
  db_subnet_group_name = aws_db_subnet_group.mysql_subnet_group.name
  publicly_accessible  = false # Do not expose to the internet
  //DB name
  db_name = "csye6225"

  parameter_group_name   = aws_db_parameter_group.my_mysql_param_group.name
  vpc_security_group_ids = [aws_security_group.mysql_security_group.id]

  # # Install MySQL on instance launch
  #             #!/bin/bash
  #             apt-get update
  #             apt-get install -y mysql-server
  #             systemctl start mysql
  #             systemctl enable mysql
  #             mysql -e "CREATE USER 'csye6225'@'%' IDENTIFIED BY 'YOUR_STRONG_PASSWORD';"
  #             mysql -e "CREATE DATABASE csye6225;"
  #             mysql -e "GRANT ALL PRIVILEGES ON csye6225.* TO 'csye6225'@'%';"
  #             mysql -e "FLUSH PRIVILEGES;"
  #             EOF

  # root_block_device {
  #   volume_size = 20
  #   volume_type = "gp2"
  # }

  tags = {
    Name = "MySQL Instance"
  }
}
