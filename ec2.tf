# ec2.tf
resource "aws_instance" "webapp" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.csye6225_public_subnet.id
  vpc_security_group_ids      = [aws_security_group.webapp_sg.id]
  associate_public_ip_address = true

  user_data = <<-EOF
              #!/bin/bash
              echo "DB_NAME=${aws_db_instance.mysql_instance.db_name}" | sudo tee /opt/myapp/.env
              echo "DB_URL=jdbc:mysql://${aws_db_instance.mysql_instance.endpoint}/${aws_db_instance.mysql_instance.db_name}?createDatabaseIfNotExist=true" | sudo tee -a /opt/myapp/.env
              echo "DB_USERNAME=csye6225" | sudo tee -a /opt/myapp/.env
              echo "DB_PASSWORD=${aws_db_instance.mysql_instance.password}" | sudo tee -a /opt/myapp/.env

              EOF


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