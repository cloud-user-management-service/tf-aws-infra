resource "aws_launch_template" "webapp_launch_template" {
  name = "csye6225_asg"

  # AMI and Instance Type
  image_id      = var.ami_id
  instance_type = var.instance_type //t2.samll
  key_name      = var.key_name

  # Networking settings
  network_interfaces {
    associate_public_ip_address = false
    subnet_id                   = aws_subnet.csye6225_private_subnet_1.id
    security_groups             = [aws_security_group.webapp_sg.id]
  }

  # IAM Instance Profile
  iam_instance_profile {
    name = aws_iam_instance_profile.web_instance_profile.name
  }

  # User Data script (to be run on instance startup)
  user_data = base64encode(<<-EOF
              #!/bin/bash
              echo "DB_NAME=${aws_db_instance.mysql_instance.db_name}" | sudo tee /opt/myapp/.env
              echo "DB_URL=jdbc:mysql://${aws_db_instance.mysql_instance.endpoint}/${aws_db_instance.mysql_instance.db_name}?createDatabaseIfNotExist=true" | sudo tee -a /opt/myapp/.env
              echo "DB_USERNAME=csye6225" | sudo tee -a /opt/myapp/.env
              echo "DB_PASSWORD=${aws_db_instance.mysql_instance.password}" | sudo tee -a /opt/myapp/.env
              echo "AWS_REGION=${var.region}" | sudo tee -a /opt/myapp/.env
              echo "AWS_BUCKET_NAME=${aws_s3_bucket.profile_image_bucket.bucket}" | sudo tee -a /opt/myapp/.env

              sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl \
                  -a fetch-config \
                  -m ec2 \
                  -c file:/opt/cloudwatch-config.json \
                  -s
              EOF
  )

  # Block Device configuration (Root volume)
  block_device_mappings {
    device_name = "/dev/sda1"
    ebs {
      volume_size           = var.volume_size
      volume_type           = var.volume_type
      delete_on_termination = true
    }
  }

  # Disable accidental termination
  disable_api_termination = false

  # Tags for the instances launched from this template
  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "WebApp Instance"
    }
  }

}

