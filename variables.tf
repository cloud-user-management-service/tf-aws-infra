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

variable "subnet_cidr_block" {
  type        = string
  description = "The CIDR block for the subnets"
  default     = "192.12.1.0/24"
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

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
  default     = ["us-west-2a", "us-west-2b", "us-west-2c"]
}

variable "private_subnet_cidr_block_a" {
  type        = string
  description = "The CIDR block for the private subnets"
  default     = "192.12.2.0/24"
}

variable "private_subnet_cidr_block_b" {
  type        = string
  description = "The CIDR block for the private subnets"
  default     = "192.12.3.0/24"
}

variable "db_password" {
  type        = string
  description = "The password for the database"
  #   sensitive   = true
  default = "CSYE6225password"
}

variable "dev_domain_zone_id" {
  type        = string
  description = "The zone ID for the S3 bucket"
  default     = "Z00435553RLQ8XGFYJJS3"
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


