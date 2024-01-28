resource "aws_vpc" "my_vpc" {
    cidr_block = var.vpc_cidr_block
    tags = {
      Name = var.vpc_name
    }    
}
resource "aws_subnet" "public_subnet" {
    vpc_id = aws_vpc.my_vpc.id
    cidr_block = var.public_subnet_cidr_block
    tags = {
      Name = var.public_subnet_name
    }
}

resource "aws_subnet" "private_subnet" {
    vpc_id = aws_vpc.my_vpc.id
    cidr_block = var.private_subnet_cidr_block
    tags = {
      Name = var.private_subnet_name
    }
}

resource "aws_internet_gateway" "my_IG" {
    vpc_id = aws_vpc.my_vpc.id 
    tags = {
        Name = var.internet_gateway_name
    }
}

resource "aws_route_table" "publicRT" {
    vpc_id = aws_vpc.my_vpc.id
    route = {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.my_IG.id
    }
    tags = {
      Name = var.public_route_table_name
    }
}

resource "aws_route_table_association" "public_association" {
    subnet_id = aws_subnet.public_subnet.id
    route_table_id = aws_route_table.publicRT.id
}

resource "aws_nat_gateway" "my_nat" {
    connectivity_type = "private"
    subnet_id = aws_subnet.public_subnet.id
    tags = {
      Name = var.nat_gateway_name
    }
}

resource "aws_route_table" "privateRT" {
    vpc_id = aws_vpc.my_vpc.id
    route = {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_nat_gateway.my_nat.id
    }
    tags = {
      Name = var.private_route_table_name
    }
}

resource "aws_route_table_association" "private_association" {
    subnet_id = aws_subnet.private_subnet.id
    route_table_id = aws_route_table.privateRT.id  
}