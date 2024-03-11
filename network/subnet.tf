
#------------------- public subnet 1 ------------------------

resource "aws_subnet" "public1_iti" {
  vpc_id     = aws_vpc.iti_vpc.id
  cidr_block = var.public1_subnet_cidr
  availability_zone = "${var.region}b"

  tags = {
    Name = "public1_iti"
  }
}

#------------------- public subnet 2 ------------------------

resource "aws_subnet" "public2_iti" {
  vpc_id     = aws_vpc.iti_vpc.id
  cidr_block = var.public2_subnet_cidr
  availability_zone = "${var.region}a"

  tags = {
    Name = "public2_iti"
  }
}

#------------------- private subnet 1 ------------------------

resource "aws_subnet" "private1_iti" {
  vpc_id     = aws_vpc.iti_vpc.id
  cidr_block = var.private1_subnet_cidr
  availability_zone = "${var.region}b"

  tags = {
    Name = "private1_iti"
  }
}

#------------------- private subnet 2 ------------------------

resource "aws_subnet" "private2_iti" {
  vpc_id     = aws_vpc.iti_vpc.id
  cidr_block = var.private2_subnet_cidr
 availability_zone = "${var.region}a"

  tags = {
    Name = "private2_iti"
  }
}
