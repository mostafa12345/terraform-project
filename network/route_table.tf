

#------------------- public route table ------------------------

resource "aws_route_table" "public_iti" {
  vpc_id = aws_vpc.iti_vpc.id
 route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.iti_gw.id
  }
 route {
    cidr_block = "192.168.0.0/16"
    gateway_id = "local"
    }
}

#------------------- public 1 route_table_association ------------------------

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public1_iti.id
  route_table_id = aws_route_table.public_iti.id
}
 
#------------------- public 2 route_table_association ------------------------

resource "aws_route_table_association" "public2" {
  subnet_id      = aws_subnet.public2_iti.id
  route_table_id = aws_route_table.public_iti.id
}

#------------------- private route table ------------------------

resource "aws_route_table" "private_iti" {
  vpc_id = aws_vpc.iti_vpc.id

 route {
    cidr_block = "192.168.0.0/16"
    gateway_id = "local"
    }
  }

#------------------- private 1 route_table_association ------------------------

resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.private1_iti.id
  route_table_id = aws_route_table.private_iti.id
}

#------------------- private 2 route_table_association ------------------------

resource "aws_route_table_association" "private2" {
  subnet_id      = aws_subnet.private2_iti.id
  route_table_id = aws_route_table.private_iti.id
}
