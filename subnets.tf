resource "aws_subnet" "csye6225_public_subnet_1" {
  vpc_id            = aws_vpc.csye6225.id
  cidr_block        = var.public_subnet1_cidr_block
  availability_zone = var.availability_zones[0]

  map_public_ip_on_launch = true

  tags = {
    Name = "csye6225_public_subnet"
  }
}

resource "aws_subnet" "csye6225_public_subnet_2" {
  vpc_id            = aws_vpc.csye6225.id
  cidr_block        = var.public_subnet2_cidr_block
  availability_zone = var.availability_zones[1]

  map_public_ip_on_launch = true

  tags = {
    Name = "csye6225_public_subnet"
  }
}

resource "aws_subnet" "csye6225_private_subnet_1" {
  vpc_id            = aws_vpc.csye6225.id
  cidr_block        = var.private_subnet1_cidr_block
  availability_zone = var.availability_zones[0]

  map_public_ip_on_launch = false

  tags = {
    Name = "csye6225_private_subnet"
  }
}

resource "aws_subnet" "csye6225_private_subnet_2" {
  vpc_id            = aws_vpc.csye6225.id
  cidr_block        = var.private_subnet2_cidr_block
  availability_zone = var.availability_zones[1]

  map_public_ip_on_launch = false

  tags = {
    Name = "csye6225_private_subnet"
  }
}

//associate the public route table with the public subnets
resource "aws_route_table_association" "csye6225_public_subnet_association" {
  subnet_id      = aws_subnet.csye6225_public_subnet_1.id
  route_table_id = aws_route_table.csye6225_public_rt_az1.id
}

resource "aws_route_table_association" "csye6225_public_subnet_association_2" {
  subnet_id      = aws_subnet.csye6225_public_subnet_2.id
  route_table_id = aws_route_table.csye6225_public_rt_az2.id
}

//associate the private route table with the private subnets
resource "aws_route_table_association" "csye6225_private_subnet_association_1" {
  subnet_id      = aws_subnet.csye6225_private_subnet_1.id
  route_table_id = aws_route_table.csye6225_private_rt_az1.id
}

resource "aws_route_table_association" "csye6225_private_subnet_association_2" {
  subnet_id      = aws_subnet.csye6225_private_subnet_2.id
  route_table_id = aws_route_table.csye6225_private_rt_az2.id
}
