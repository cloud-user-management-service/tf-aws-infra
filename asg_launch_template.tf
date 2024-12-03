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

  # Block Device configuration (Root volume)
  block_device_mappings {
    device_name = "/dev/sda1"
    ebs {
      volume_size           = var.volume_size
      volume_type           = var.volume_type
      delete_on_termination = true
      encrypted             = true
      kms_key_id            = aws_kms_key.ec2_key.arn
    }
  }

  # User Data script (to be run on instance startup)
  user_data = base64encode(<<-EOF
              #!/bin/bash

              # Logging setup
              LOG_FILE="/var/log/user_data.log"
              exec > >(tee -a "$LOG_FILE") 2>&1
              echo "User data script started at $(date)"

              echo "DB_NAME=${aws_db_instance.mysql_instance.db_name}" | sudo tee /opt/myapp/.env
              echo "DB_URL=jdbc:mysql://${aws_db_instance.mysql_instance.endpoint}/${aws_db_instance.mysql_instance.db_name}?createDatabaseIfNotExist=true" | sudo tee -a /opt/myapp/.env
              echo "DB_USERNAME=csye6225" | sudo tee -a /opt/myapp/.env

              # Install jq for JSON parsing if not already installed
              if ! command -v jq &> /dev/null; then
                  echo "jq not found, installing..."
                  sudo yum install -y jq
              fi

              # Install AWS CLI if not already installed
              if ! command -v aws &> /dev/null; then
                  echo "AWS CLI not found, installing..."
                  # Download and install the AWS CLI v2
                  curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
                  apt install unzip
                  unzip awscliv2.zip
                  sudo ./aws/install
              fi

              # Retrieve DB_PASSWORD securely from Secrets Manager
              echo "DB_PASSWORD=$(aws secretsmanager get-secret-value \
                  --secret-id ${var.db_password_secret_name} \
                  --query 'SecretString' \
                  --output text | jq -r '.password')" | sudo tee -a /opt/myapp/.env

              echo "AWS_SNS_TOPIC_ARN=${aws_sns_topic.email_verification_topic.arn}" | sudo tee -a /opt/myapp/.env
              echo "AWS_REGION=${var.region}" | sudo tee -a /opt/myapp/.env
              echo "AWS_BUCKET_NAME=${aws_s3_bucket.profile_image_bucket.bucket}" | sudo tee -a /opt/myapp/.env
              
              sudo chown -R csye6225:csye6225 /opt/myapp/.env

              sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl \
                  -a fetch-config \
                  -m ec2 \
                  -c file:/opt/cloudwatch-config.json \
                  -s
              EOF
  )



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

