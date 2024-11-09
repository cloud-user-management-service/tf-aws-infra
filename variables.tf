variable "vp_cidr" {
  type        = string
  description = "The CIDR for the VPC"
  default     = "192.12.0.0/16"
}

variable "region" {
  type        = string
  description = "The region in which the VPC will be created"
  default     = "us-west-2"
}

variable "public_subnet1_cidr_block" {
  type        = string
  description = "The CIDR block for the subnets"
  default     = "192.12.1.0/24"
}

variable "public_subnet2_cidr_block" {
  type        = string
  description = "The CIDR block for the subnets"
  default     = "192.12.2.0/24"
}

variable "private_subnet1_cidr_block" {
  type        = string
  description = "The CIDR block for the private subnets"
  default     = "192.12.3.0/24"
}

variable "private_subnet2_cidr_block" {
  type        = string
  description = "The CIDR block for the private subnets"
  default     = "192.12.4.0/24"
}

variable "ami_id" {
  type        = string
  description = "The AMI ID for the EC2 instance"
  # default     = "ami-0d9bf1d536f327265"
}

variable "instance_type" {
  description = "The type of EC2 instance"
  type        = string
  default     = "t2.small"
}

variable "volume_size" {
  description = "The size of the volume"
  type        = number
  default     = 25
}

variable "volume_type" {
  description = "The type of volume"
  type        = string
  default     = "gp2"
}

variable "allow_ports" {
  description = "List of ports to allow in the security group"
  type        = list(number)
  default     = [22, 80, 443, 8081]
}

variable "ingress_port_http" {
  description = "The port for HTTP traffic"
  type        = number
  default     = 80
}

variable "ingress_port_https" {
  description = "The port for HTTPS traffic"
  type        = number
  default     = 443
}

variable "ssh_port" {
  description = "The port for SSH traffic"
  type        = number
  default     = 22
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
  default     = ["us-west-2a", "us-west-2b", "us-west-2c"]
}

variable "private_subnet_cidr_block_a" {
  type        = string
  description = "The CIDR block for the private subnets"
  default     = "192.12.5.0/24"
}

variable "private_subnet_cidr_block_b" {
  type        = string
  description = "The CIDR block for the private subnets"
  default     = "192.12.6.0/24"
}

variable "db_password" {
  type        = string
  description = "The password for the database"
  #   sensitive   = true
  default = "CSYE6225password"
}


variable "db_identifier" {
  type        = string
  description = "The identifier for the RDS instance"
  default     = "csye6225"
}

variable "db_username" {
  type        = string
  description = "The username for the database"
  default     = "csye6225"
}

variable "db_name" {
  type        = string
  description = "The name of the database"
  default     = "csye6225"
}


variable "domain_zone_id" {
  type        = string
  description = "The zone ID for the Route53"
  default     = "Z00435553RLQ8XGFYJJS3"
}

variable "domain_name" {
  type        = string
  description = "The domain name for the Route53 record"
}

variable "my_ip" {
  type        = string
  description = "The IP address of the user"
  default     = "73.97.223.46"
}

variable "key_name" {
  type        = string
  description = "The name of the key pair"
}

variable "listener_port" {
  type        = number
  description = "The port for the listener"
  default     = 80
}

variable "webapp_port" {
  type        = number
  description = "The port for the webapp"
  default     = 8081
}

variable "cooldown_period" {
  type        = number
  description = "The cooldown period for the autoscaling group"
  default     = 60
}

variable "scaling_adjustment_up_number" {
  type        = number
  description = "The number of instances to add when scaling up"
  default     = 1
}

variable "scaling_adjustment_down_number" {
  type        = number
  description = "The number of instances to remove when scaling down"
  default     = -1
}

variable "health_check_grace_period" {
  type        = number
  description = "The grace period for the health check"
  default     = 300
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
  default     = 1
}

variable "min_size" {
  type        = number
  description = "The minimum size for the autoscaling group"
  default     = 1
}

variable "max_size" {
  type        = number
  description = "The maximum size for the autoscaling group"
  default     = 3
}

variable "threshold_up" {
  type        = number
  description = "The threshold for scaling up"
  default     = 5
}

variable "threshold_down" {
  type        = number
  description = "The threshold for scaling down"
  default     = 3
}

variable "listener_protocol" {
  type        = string
  description = "The protocol for the listener"
  default     = "HTTP"
}

variable "listener_action_type" {
  type        = string
  description = "The action type for the listener"
  default     = "forward"
}

variable "interval" {
  type        = number
  description = "The interval for the health check"
  default     = 30
}

variable "timeout" {
  type        = number
  description = "The timeout for the health check"
  default     = 5
}

variable "healthy_threshold" {
  type        = number
  description = "The healthy threshold for the health check"
  default     = 2
}

variable "unhealthy_threshold" {
  type        = number
  description = "The unhealthy threshold for the health check"
  default     = 2
}

variable "scale_evaluation_periods" {
  type        = number
  description = "The evaluation periods for the scaling"
  default     = 2
}

variable "scale_period" {
  type        = number
  description = "The period for the scaling"
  default     = 120
}

variable "scaling_adjustment_type" {
  type        = string
  description = "The type of scaling adjustment"
  default     = "ChangeInCapacity"
}

variable "healthz_path" {
  type        = string
  description = "The path for the health check"
  default     = "/healthz"
}

variable "max_connections" {
  type        = number
  description = "The maximum number of connections for the database"
  default     = 500
}
