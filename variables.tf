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
  default     = "ami-0d9bf1d536f327265"
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





# variable "public_base_cidr" {
#   type        = string
#   description = "The base CIDR for the public subnets"
# }

# variable "private_base_cidr" {
#   type        = string
#   description = "The base CIDR for the private subnets"
# }

# variable "subnet_new_bits" {
#   type        = number
#   description = "The number of bits to add to the subnet"
# }

# variable "start_index_of_availability_zones" {
#   type        = number
#   description = "The start index of the availability zones"
# }

# variable "end_index_of_availability_zones" {
#   type        = number
#   description = "The end index of the availability zones"
# }