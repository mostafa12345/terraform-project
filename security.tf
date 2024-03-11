
#------------------- public_security ------------------------

resource "aws_security_group" "public_sec" {
  name        = "public_sec"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = module.network.vpc_id

  tags = {
    Name = "public_sec"
  }
}


#------------------- ingress_rule ------------------------

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.public_sec.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

#------------------- egress_rule ------------------------

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.public_sec.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

#------------------- private_security ------------------------

resource "aws_security_group" "private_sec" {
  name        = "private_sec"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = module.network.vpc_id

  tags = {
    Name = "private_sec"
  }
}

#------------------- ingress_rule ------------------------

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.private_sec.id
  cidr_ipv4         = var.vpc_cidr
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22

}
resource "aws_vpc_security_group_ingress_rule" "allow_3000" {
  security_group_id = aws_security_group.private_sec.id
  cidr_ipv4         = var.vpc_cidr
  from_port         = 3000
  ip_protocol       = "tcp"
  to_port           = 3000
}
