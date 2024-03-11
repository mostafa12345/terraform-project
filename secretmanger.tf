#------------------- secretsmanager ------------------------
resource "aws_secretsmanager_secret" "private_key_secret" {
  name = "private-key-secret"
  recovery_window_in_days = 0
}


#------------------- private key ------------------------
resource "aws_secretsmanager_secret_version" "private_key_secret_version" {
  secret_id     = aws_secretsmanager_secret.private_key_secret.id
  secret_string = tls_private_key.example.private_key_pem
}
