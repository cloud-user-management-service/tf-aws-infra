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


/*
//ceate 3 public subnets in 3 different availability zones
resource "aws_subnet" "csye6225_public_subnet" {
  for_each = toset(slice(data.aws_availability_zones.available.names, var.start_index_of_availability_zones, var.end_index_of_availability_zones))

  vpc_id                  = aws_vpc.csye6225.id
  cidr_block              = cidrsubnet(var.public_base_cidr, var.subnet_new_bits, index(data.aws_availability_zones.available.names, each.value))
  availability_zone       = each.value
  map_public_ip_on_launch = true #enable public ip

  tags = {
    Name = "csye6225-public-subnet-${each.value}"
  }
}
*/

/*
//associate the public route table with the public subnets
resource "aws_route_table_association" "csye6225_public_subnet_association" {
  for_each = aws_subnet.csye6225_public_subnet

  subnet_id      = each.value.id
  route_table_id = aws_route_table.csye6225_public_rt.id
}
*/

/*
//create 3 private subnets in 3 different availability zones
resource "aws_subnet" "csye6225_private_subnet" {
  for_each = toset(slice(data.aws_availability_zones.available.names, var.start_index_of_availability_zones, var.end_index_of_availability_zones))

  vpc_id     = aws_vpc.csye6225.id
  cidr_block = cidrsubnet(var.private_base_cidr, var.subnet_new_bits, index(data.aws_availability_zones.available.names, each.value))
  # cidr_block = cidrsubnet(tolist(var.private_subnets_cidrs)[index(data.aws_availability_zones.available.names, each.value)], var.subnet_new_bits, index(data.aws_availability_zones.available.names, each.value))
  availability_zone       = each.value
  map_public_ip_on_launch = false #disable public ip

  tags = {
    Name = "csye6225-private-subnet-${each.value}"
  }
}
*/

/*
//associate the private route table with the private subnets
resource "aws_route_table_association" "csye6225_private_subnet_association" {
  for_each = aws_subnet.csye6225_private_subnet

  subnet_id      = each.value.id
  route_table_id = aws_route_table.csye6225_private_rt.id
}
*/