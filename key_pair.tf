#------------------- genrate key ------------------------
resource "tls_private_key" "example" {
   algorithm = "RSA"
   rsa_bits = 4096
}


#------------------- public key ------------------------
resource "aws_key_pair" "example_keypair" {
  key_name   = "example_keypair"
  public_key = tls_private_key.example.public_key_openssh
}

