resource "aws_instance" "web_priv" {
  ami           = "ami-00adafae70b8029d8"
  instance_type = "t3.micro"
  subnet_id = aws_subnet.subnet-private.id
  vpc_security_group_ids = [aws_security_group.sg-01.id]

  tags = {
    Name = "web-server-01"
  }
}


resource "aws_instance" "web_pub" {
  ami           = "ami-00adafae70b8029d8"
  instance_type = "t3.micro"
  associate_public_ip_address = true
  subnet_id = aws_subnet.subnet-public.id
  vpc_security_group_ids = [aws_security_group.sg-01.id]

  tags = {
    Name = "web-server-02"
  }
}