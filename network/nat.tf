
#------------------- elastic ip ------------------------
resource "aws_eip" "example" {
  domain = "vpc"
}


#------------------- Nat gateway ------------------------
resource "aws_nat_gateway" "example" {
  allocation_id = aws_eip.example.id
  subnet_id     = aws_subnet.public1_iti.id

  tags = {
    Name = "gw NAT"
  }

}
