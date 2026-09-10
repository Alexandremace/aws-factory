resource "aws_vpc" "vpc01" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "vpc-core"
  }
}
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc01.id

  tags = {
    Name = "gw-core"
  }
}


resource "aws_subnet" "subnet-private" {
  vpc_id     = aws_vpc.vpc01.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "subnet-private"
  }
  }

resource "aws_subnet" "subnet-public" {
  vpc_id     = aws_vpc.vpc01.id
  cidr_block = "10.0.2.0/24"
  tags = {
    Name = "subnet-public"
  }
  
}

resource "aws_route_table" "rt-private" {
  vpc_id = aws_vpc.vpc01.id
  tags = {
    Name = "rt-private"
  }
  }


resource "aws_route_table" "rt-public" {
  vpc_id = aws_vpc.vpc01.id
  tags = {
    Name = "rt-public"
  }

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
}

resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.subnet-private.id
  route_table_id = aws_route_table.rt-private.id
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.subnet-public.id
  route_table_id = aws_route_table.rt-public.id
}