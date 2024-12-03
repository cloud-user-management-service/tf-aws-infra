# Application security group for the EC2 instance
resource "aws_security_group" "webapp_sg" {
  name        = "webapp_sg"
  description = "Create security group for webapp ec2 instance"
  vpc_id      = aws_vpc.csye6225.id

  # dynamic "ingress" {
  #   for_each = var.allow_ports
  #   content {
  #     from_port   = ingress.value
  #     to_port     = ingress.value
  #     protocol    = "tcp"
  #     cidr_blocks = ["0.0.0.0/0"]
  #   }
  # }

  //Allow inbound traffic from load balancer sg on webapp port 8081
  ingress {
    description     = "Allow inbound traffic from load balancer sg on webapp port 8081"
    from_port       = var.webapp_port //Referencing the port of the webapp
    to_port         = var.webapp_port
    protocol        = "tcp"
    security_groups = [aws_security_group.lb_sg.id] //Referencing the security group of load balancer
  }

  //SSH access from anywhere 
  ingress {
    description = "Allow SSH access from anywhere"
    from_port   = var.ssh_port //22
    to_port     = var.ssh_port
    protocol    = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }



  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "webapp_sg"
  }
}