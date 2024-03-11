       #------------------- public EC2 ------------------------
resource "aws_instance" "publicserver_iti" {
  ami           = var.ami
  subnet_id       = module.network.public_subnet_id
  associate_public_ip_address = true
  key_name        = aws_key_pair.example_keypair.key_name
  vpc_security_group_ids  = [aws_security_group.public_sec.id]
  depends_on = [aws_security_group.public_sec]
  instance_type = var.instance_type
  tags = {
    Name = "publicserver_iti"
  }
}

       #------------------- private EC2 ------------------------
resource "aws_instance" "privateserver_iti" {
  ami           = var.ami 
  subnet_id       = module.network.private_subnet_id
  vpc_security_group_ids  = [aws_security_group.private_sec.id]
  depends_on = [aws_security_group.private_sec]
  instance_type = var.instance_type
  tags = {
    Name = "privateserver_iti"
  }
}




