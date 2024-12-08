variable "vp_cidr" {
  type        = string
  description = "The CIDR for the VPC"
}

variable "region" {
  type        = string
  description = "The region in which the VPC will be created"
}

variable "public_subnet1_cidr_block" {
  type        = string
  description = "The CIDR block for the subnets"
}

variable "public_subnet2_cidr_block" {
  type        = string
  description = "The CIDR block for the subnets"
}

variable "private_subnet1_cidr_block" {
  type        = string
  description = "The CIDR block for the private subnets"
}

variable "private_subnet2_cidr_block" {
  type        = string
  description = "The CIDR block for the private subnets"
}

variable "ami_id" {
  type        = string
  description = "The AMI ID for the EC2 instance"
}

variable "instance_type" {
  description = "The type of EC2 instance"
  type        = string
}

variable "volume_size" {
  description = "The size of the volume"
  type        = number
}

variable "volume_type" {
  description = "The type of volume"
  type        = string
}

variable "allow_ports" {
  description = "List of ports to allow in the security group"
  type        = list(number)
}

variable "ingress_port_http" {
  description = "The port for HTTP traffic"
  type        = number
}

variable "ingress_port_https" {
  description = "The port for HTTPS traffic"
  type        = number
}

variable "ssh_port" {
  description = "The port for SSH traffic"
  type        = number
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
}

variable "private_subnet_cidr_block_a" {
  type        = string
  description = "The CIDR block for the private subnets"
}

variable "private_subnet_cidr_block_b" {
  type        = string
  description = "The CIDR block for the private subnets"
}

variable "db_password" {
  type        = string
  description = "The password for the database"
}


variable "db_identifier" {
  type        = string
  description = "The identifier for the RDS instance"
}

variable "db_username" {
  type        = string
  description = "The username for the database"
}

variable "db_name" {
  type        = string
  description = "The name of the database"
}


variable "domain_zone_id" {
  type        = string
  description = "The zone ID for the Route53"
}

variable "domain_name" {
  type        = string
  description = "The domain name for the Route53 record"
}


variable "key_name" {
  type        = string
  description = "The name of the key pair"
}

variable "listener_port_https" {
  type        = number
  description = "The port for the listener"
}

variable "listener_port_http" {
  type        = number
  description = "The port for the listener"
}

variable "webapp_port" {
  type        = number
  description = "The port for the webapp"
}

variable "cooldown_period" {
  type        = number
  description = "The cooldown period for the autoscaling group"
}

variable "scaling_adjustment_up_number" {
  type        = number
  description = "The number of instances to add when scaling up"
}

variable "scaling_adjustment_down_number" {
  type        = number
  description = "The number of instances to remove when scaling down"
}

variable "health_check_grace_period" {
  type        = number
  description = "The grace period for the health check"
}

variable "tag_key" {
  type        = string
  description = "The key for the tag"
  default     = "Application"
}

variable "tag_value" {
  type        = string
  description = "The value for the tag"
  default     = "webapp"
}

variable "desired_capacity" {
  type        = number
  description = "The desired capacity for the autoscaling group"
}

variable "min_size" {
  type        = number
  description = "The minimum size for the autoscaling group"
}

variable "max_size" {
  type        = number
  description = "The maximum size for the autoscaling group"
}

variable "threshold_up" {
  type        = number
  description = "The threshold for scaling up"
}

variable "threshold_down" {
  type        = number
  description = "The threshold for scaling down"
}

variable "listener_protocol_https" {
  type        = string
  description = "The protocol for the listener"
}

variable "listener_protocol_http" {
  type        = string
  description = "The protocol for the listener"
}

variable "listener_action_type" {
  type        = string
  description = "The action type for the listener"
}

variable "interval" {
  type        = number
  description = "The interval for the health check"
}

variable "timeout" {
  type        = number
  description = "The timeout for the health check"
}

variable "healthy_threshold" {
  type        = number
  description = "The healthy threshold for the health check"
}

variable "unhealthy_threshold" {
  type        = number
  description = "The unhealthy threshold for the health check"
}

variable "scale_evaluation_periods" {
  type        = number
  description = "The evaluation periods for the scaling"
}

variable "scale_period" {
  type        = number
  description = "The period for the scaling"
}

variable "scaling_adjustment_type" {
  type        = string
  description = "The type of scaling adjustment"
}

variable "healthz_path" {
  type        = string
  description = "The path for the health check"
}

variable "max_connections" {
  type        = number
  description = "The maximum number of connections for the database"
}

variable "rds_username" {
  type        = string
  description = "The username for the RDS instance"
}

variable "rds_password" {
  type        = string
  description = "The password for the RDS instance"
}

variable "email_from" {
  type        = string
  description = "The email address from which the email will be sent"
}

variable "ses_region" {
  type        = string
  description = "The region for the SES"
}

variable "sendgrid_api_key" {
  type        = string
  description = "The API key for SendGrid"
}


variable "lambda_zip_file" {
  type        = string
  description = "The path to the lambda zip file"
}

variable "base_url" {
  type        = string
  description = "The base URL for the webapp"
}

variable "key_rotation" {
  description = "Enable key rotation"
  default     = true
}

variable "db_password_length" {
  description = "Length of the auto-generated database password"
  default     = 16
}

variable "email_service_secret_name" {
  description = "The name of the email service credential"
}

variable "db_password_secret_name" {
  description = "The name of the database password secret"
}

variable "ssl_policy" {
  description = "The SSL policy for the listener"
  default     = "ELBSecurityPolicy-TLS-1-2-2017-01"
}

variable "certificate_arn" {
  description = "The ARN for the SSL certificate"
}

variable "rotation_period_in_days" {
  description = "The rotation period for the key"
  default     = 90
}