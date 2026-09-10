resource "tls_private_key" "web" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "web" {
  key_name   = "web-server-key"
  public_key = tls_private_key.web.public_key_openssh
}

resource "local_sensitive_file" "web_private_key" {
  content         = tls_private_key.web.private_key_pem
  filename        = var.paths
  file_permission = "0400"
}