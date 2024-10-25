resource "aws_db_subnet_group" "mysql_subnet_group" {
  name       = "csye6225-private-rds-subnet-group"
  subnet_ids = [
    aws_subnet.csye6225_private_subnet_a.id,
    aws_subnet.csye6225_private_subnet_b.id,
  ]

  tags = {
    Name = "csye6225-mysql-subnet-group"
  }
}
