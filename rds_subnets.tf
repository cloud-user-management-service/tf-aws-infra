resource "aws_subnet" "csye6225_private_subnet_a" {
  vpc_id            = aws_vpc.csye6225.id
  cidr_block        = var.private_subnet_cidr_block_a
  availability_zone = var.availability_zones[0]

  map_public_ip_on_launch = false

  tags = {
    Name = "csye6225_private_subnet"
  }
}

resource "aws_subnet" "csye6225_private_subnet_b" {
  vpc_id            = aws_vpc.csye6225.id
  cidr_block        = var.private_subnet_cidr_block_b
  availability_zone = var.availability_zones[1]

  map_public_ip_on_launch = false

  tags = {
    Name = "csye6225_private_subnet"
  }
}

//associate the private route table with the private subnets
resource "aws_route_table_association" "csye6225_private_subnet_association_a" {
  subnet_id      = aws_subnet.csye6225_private_subnet_a.id
  route_table_id = aws_route_table.csye6225_private_rt.id

}

resource "aws_route_table_association" "csye6225_private_subnet_association_b" {
  subnet_id      = aws_subnet.csye6225_private_subnet_b.id
  route_table_id = aws_route_table.csye6225_private_rt.id

}


