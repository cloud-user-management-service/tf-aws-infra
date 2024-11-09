# //create public route table
# resource "aws_route_table" "csye6225_public_rt" {
#   vpc_id = aws_vpc.csye6225.id

#   tags = {
#     Name = "csye6225-public-rt"
#   }
# }

# resource "aws_route_table" "csye6225_private_rt" {
#   vpc_id = aws_vpc.csye6225.id

#   tags = {
#     Name = "csye6225-private-rt"
#   }
# }


# //create a public route in the public route table that points to the internet gateway
# resource "aws_route" "csye6225_public_route" {
#   route_table_id         = aws_route_table.csye6225_public_rt.id
#   destination_cidr_block = "0.0.0.0/0"
#   gateway_id             = aws_internet_gateway.csye6225_igw.id
# }

# //create a private route in the private route table that points to the NAT gateway
# resource "aws_route" "csye6225_private_route" {
#   route_table_id         = aws_route_table.csye6225_private_rt.id
#   destination_cidr_block = "0.0.0.0/0" //????
#   gateway_id             = aws_internet_gateway.csye6225_igw.id
# }

# Create a Route Table for AZ1 (for Private Subnet 1)
resource "aws_route_table" "csye6225_private_rt_az1" {
  vpc_id = aws_vpc.csye6225.id

  tags = {
    Name = "csye6225-private-rt-az1"
  }
}

# Create a Route Table for AZ2 (for Private Subnet 2)
resource "aws_route_table" "csye6225_private_rt_az2" {
  vpc_id = aws_vpc.csye6225.id

  tags = {
    Name = "csye6225-private-rt-az2"
  }
}

# Create routes for AZ1 private route table, using the NAT Gateway in AZ1
resource "aws_route" "csye6225_private_route_az1" {
  route_table_id         = aws_route_table.csye6225_private_rt_az1.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.csye6225_nat_gw_1.id
}

# Create routes for AZ2 private route table, using the NAT Gateway in AZ2
resource "aws_route" "csye6225_private_route_az2" {
  route_table_id         = aws_route_table.csye6225_private_rt_az2.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.csye6225_nat_gw_2.id
}

# Associate the route table with the private subnet in AZ1
resource "aws_route_table_association" "csye6225_private_rt_association_az1" {
  subnet_id      = aws_subnet.csye6225_private_subnet_1.id
  route_table_id = aws_route_table.csye6225_private_rt_az1.id
}

# Associate the route table with the private subnet in AZ2
resource "aws_route_table_association" "csye6225_private_rt_association_az2" {
  subnet_id      = aws_subnet.csye6225_private_subnet_2.id
  route_table_id = aws_route_table.csye6225_private_rt_az2.id
}


# Create a Route Table for AZ1 (for Public Subnet 1)
resource "aws_route_table" "csye6225_public_rt_az1" {
  vpc_id = aws_vpc.csye6225.id

  tags = {
    Name = "csye6225-public-rt-az1"
  }
}

# Create a Route Table for AZ2 (for Public Subnet 2)
resource "aws_route_table" "csye6225_public_rt_az2" {
  vpc_id = aws_vpc.csye6225.id

  tags = {
    Name = "csye6225-public-rt-az2"
  }
}

# Create routes for AZ1 public route table, using the Internet Gateway
resource "aws_route" "csye6225_public_route_az1" {
  route_table_id         = aws_route_table.csye6225_public_rt_az1.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.csye6225_igw.id
}

# Create routes for AZ2 public route table, using the Internet Gateway
resource "aws_route" "csye6225_public_route_az2" {
  route_table_id         = aws_route_table.csye6225_public_rt_az2.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.csye6225_igw.id
}

# Associate the route table with the public subnet in AZ1
resource "aws_route_table_association" "csye6225_public_rt_association_az1" {
  subnet_id      = aws_subnet.csye6225_public_subnet_1.id
  route_table_id = aws_route_table.csye6225_public_rt_az1.id
}

# Associate the route table with the public subnet in AZ2
resource "aws_route_table_association" "csye6225_public_rt_association_az2" {
  subnet_id      = aws_subnet.csye6225_public_subnet_2.id
  route_table_id = aws_route_table.csye6225_public_rt_az2.id
}

