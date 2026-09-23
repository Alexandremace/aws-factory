resource "aws_instance" "web_priv" {
  ami           = var.ami_id
  instance_type = var.instance_type

  subnet_id = var.private_subnet_id

  vpc_security_group_ids = [
    var.private_security_group_id
  ]

  key_name = var.key_name

  tags = {
    Name = "web-server-01"
  }
}

resource "aws_instance" "web_pub" {
  ami           = var.ami_id
  instance_type = var.instance_type

  associate_public_ip_address = true

  subnet_id = var.public_subnet_id

  vpc_security_group_ids = [
    var.public_security_group_id
  ]

  key_name = var.key_name

  tags = {
    Name = "web-server-02"
  }
}