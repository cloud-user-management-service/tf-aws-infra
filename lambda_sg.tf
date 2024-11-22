resource "aws_security_group" "lambda_sg" {
  name        = "lambda_sg"
  description = "Allow Lambda to access RDS"
  vpc_id      = aws_vpc.csye6225.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}