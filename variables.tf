variable "vp_cidr" {
  type= string
  description = "The CIDR for the VPC"
}

variable "region" {
  type=string
  description = "The region in which the VPC will be created"
}

variable "public_base_cidr" {
  type                  =      string
  description = "The base CIDR for the public subnets"
}

variable "private_base_cidr" {
  type        = string
  description = "The base CIDR for the private subnets"
}

variable "subnet_new_bits" {
  type        = number
  description = "The number of bits to add to the subnet"
}

variable "start_index_of_availability_zones" {
  type        = number
  description = "The start index of the availability zones"
}

variable "end_index_of_availability_zones" {
  type        = number
  description = "The end index of the availability zones"
}