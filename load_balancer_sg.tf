# Creating Security Group for load balancer
resource "aws_security_group" "lb_sg" {
  name        = "load_balancer_sg"
  description = "Allow inbound and outbound traffic for load balancer"
  vpc_id      = aws_vpc.csye6225.id

  # Inbound Rules
  # HTTP access from anywhere
  ingress {
    description = "Allow HTTP access from anywhere"
    from_port   = var.ingress_port_http //80
    to_port     = var.ingress_port_http
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTPS access from anywhere
  ingress {
    description = "Allow HTTPS access from anywhere"
    from_port   = var.ingress_port_https //443
    to_port     = var.ingress_port_https
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  //allow ipv6 
  ingress {
    description      = "Allow HTTP access from anywhere"
    from_port        = var.ingress_port_http //80
    to_port          = var.ingress_port_http
    protocol         = "tcp"
    ipv6_cidr_blocks = ["::/0"]
  }

  //allow ipv6 
  ingress {
    description      = "Allow HTTPS access from anywhere"
    from_port        = var.ingress_port_https //443
    to_port          = var.ingress_port_https
    protocol         = "tcp"
    ipv6_cidr_blocks = ["::/0"]
  }

  # Outbound Rules
  # Internet access to anywhere
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "load_balancer_sg"
  }
}