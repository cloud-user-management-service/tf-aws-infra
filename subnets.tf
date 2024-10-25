resource "aws_subnet" "csye6225_public_subnet" {
  vpc_id            = aws_vpc.csye6225.id
  cidr_block        = var.subnet_cidr_block
  availability_zone = var.availability_zones[0]

  map_public_ip_on_launch = true

  tags = {
    Name = "csye6225_public_subnet"
  }
}

//associate the public route table with the public subnets
resource "aws_route_table_association" "csye6225_public_subnet_association" {
  subnet_id      = aws_subnet.csye6225_public_subnet.id
  route_table_id = aws_route_table.csye6225_public_rt.id
}


