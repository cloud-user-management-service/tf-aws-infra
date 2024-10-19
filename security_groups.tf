# Application security group for the EC2 instance
resource "aws_security_group" "webapp_sg" {
  name        = "webapp_sg"
  description = "Create security group for webapp ec2 instance"
  vpc_id      = aws_vpc.csye6225.id

  dynamic "ingress" {
    for_each = var.allow_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "app_sg"
  }
}