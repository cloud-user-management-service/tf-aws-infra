# create a security group for MySQL RDS instance
resource "aws_security_group" "mysql_security_group" {
  name        = "mysql-security-group"
  description = "Create security group for MySQL RDS instance"
  vpc_id      = aws_vpc.csye6225.id

  # set the ingress rule to allow traffic from the webapp security group
  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.webapp_sg.id]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "mysql_sg"
  }

}
