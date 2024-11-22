output "vpc_id" {
  description = "ID of project VPC"
  #   value       = module.vpc.vpc_id
  value = aws_vpc.csye6225.id
}

output "subnet_id" {
  description = "ID of subnet"
  value       = aws_subnet.csye6225_public_subnet_1.id
}

output "subnet_cidr_block" {
  description = "CIDR block of subnet"
  value       = aws_subnet.csye6225_public_subnet_1.cidr_block
}

output "security_groups" {
  description = "Security groups of EC2 instance"
  value       = aws_security_group.webapp_sg.name
}


output "internet_gateway_id" {
  description = "ID of internet gateway"
  value       = aws_internet_gateway.csye6225_igw.id
}

output "sns_topic_arn" {
  value       = aws_sns_topic.email_verification_topic.arn
  description = "The ARN of the SNS topic"
}