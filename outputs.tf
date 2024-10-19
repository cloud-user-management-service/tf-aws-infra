output "vpc_id" {
  description = "ID of project VPC"
  #   value       = module.vpc.vpc_id
  value = aws_vpc.csye6225.id
}

output "subnet_id" {
  description = "ID of subnet"
  value       = aws_subnet.csye6225_public_subnet.id
}

output "subnet_cidr_block" {
  description = "CIDR block of subnet"
  value       = aws_subnet.csye6225_public_subnet.cidr_block
}

output "security_groups" {
  description = "Security groups of EC2 instance"
  value       = aws_security_group.webapp_sg.name
}

output "ec2" {
  description = "ID of EC2 instance"
  value       = aws_instance.webapp.id
}

output "instance_public_ip" {
  value = aws_instance.webapp.public_ip
}

# output "public_subnet_ids" {
#   description = "IDs of public subnets"
#   value       = aws_subnet.csye6225_public_subnet[*]

# }

# output "private_subnet_ids" {
#   description = "IDs of private subnets"
#   value       = aws_subnet.csye6225_private_subnet[*]
# }

output "internet_gateway_id" {
  description = "ID of internet gateway"
  value       = aws_internet_gateway.csye6225_igw.id
}

# output "public_route_table_id" {
#   description = "ID of public route table"
#   value       = aws_route_table.csye6225_public_rt.id
# }

# output "private_route_table_id" {
#   description = "ID of private route table"
#   value       = aws_route_table.csye6225_private_rt.id
# }

# output "public_route_id" {
#   description = "ID of public route"
#   value       = aws_route.csye6225_public_route.id
# }

# output "public_route_table_association_ids" {
#   description = "IDs of public route table associations"
#   value       = aws_route_table_association.csye6225_public_subnet_association[*]
# }

# output "private_route_table_association_ids" {
#   description = "IDs of private route table associations"
#   value       = aws_route_table_association.csye6225_private_subnet_association[*]
# }



# output "az" {
#   value = data.aws_availability_zones.available.names
# }
