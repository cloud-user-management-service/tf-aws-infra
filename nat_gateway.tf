# Allocate Elastic IPs for each NAT Gateway
resource "aws_eip" "csye6225_nat_gw_eip_1" {
  vpc = true
  tags = {
    Name = "csye6225-nat-gw-eip-1"
  }
}

resource "aws_eip" "csye6225_nat_gw_eip_2" {
  vpc = true
  tags = {
    Name = "csye6225-nat-gw-eip-2"
  }
}

# Create NAT Gateway in Public Subnet 1
resource "aws_nat_gateway" "csye6225_nat_gw_1" {
  allocation_id = aws_eip.csye6225_nat_gw_eip_1.id
  subnet_id     = aws_subnet.csye6225_public_subnet_1.id # Public subnet 1 in AZ1

  tags = {
    Name = "csye6225-nat-gw-1"
  }
}

# Create NAT Gateway in Public Subnet 2
resource "aws_nat_gateway" "csye6225_nat_gw_2" {
  allocation_id = aws_eip.csye6225_nat_gw_eip_2.id
  subnet_id     = aws_subnet.csye6225_public_subnet_2.id # Public subnet 2 in AZ2

  tags = {
    Name = "csye6225-nat-gw-2"
  }
}