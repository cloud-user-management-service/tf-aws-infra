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


output "internet_gateway_id" {
  description = "ID of internet gateway"
  value       = aws_internet_gateway.csye6225_igw.id
}

