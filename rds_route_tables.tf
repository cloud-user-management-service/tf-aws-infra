//create private route table
resource "aws_route_table" "csye6225_private_rt" {
  vpc_id = aws_vpc.csye6225.id

  tags = {
    Name = "csye6225-private-rt"
  }
}