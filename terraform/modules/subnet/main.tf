resource "aws_subnet" "modules_public_subnet" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.public_subnet.cidr
  availability_zone       = var.public_subnet.az
  map_public_ip_on_launch = true

  tags = {
    Name = var.public_subnet.name
  }
}

resource "aws_subnet" "modules_private_subnet" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.private_subnet.cidr
  availability_zone       = var.private_subnet.az
  map_public_ip_on_launch = false

  tags = {
    Name = var.private_subnet.name
  }
}