//create public route table
resource "aws_route_table" "csye6225_public_rt" {
    vpc_id = aws_vpc.csye6225.id

    tags = {
        Name = "csye6225-public-rt"
    }
}


//create a public route in the public route table that points to the internet gateway
resource "aws_route" "csye6225_public_route" {
    route_table_id = aws_route_table.csye6225_public_rt.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.csye6225_igw.id
}


//create private route table
resource "aws_route_table" "csye6225_private_rt" {
    vpc_id = aws_vpc.csye6225.id

    tags = {
        Name = "csye6225-private-rt"
    }
}




