//create internet gateway
resource "aws_internet_gateway" "csye6225_igw" {
    vpc_id = aws_vpc.csye6225.id
    
    tags = {
        Name = "csye6225-igw"
    }
}
