# ec2.tf
resource "aws_instance" "webapp" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.csye6225_public_subnet.id
  vpc_security_group_ids      = [aws_security_group.webapp_sg.id]
  associate_public_ip_address = true

  root_block_device {
    volume_size           = var.volume_size
    volume_type           = var.volume_type
    delete_on_termination = true
  }

  #Disable protection against accidental termination
  disable_api_termination = false

  tags = {
    Name = "WebApp Instance"
  }
}