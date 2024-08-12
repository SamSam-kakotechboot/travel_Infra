resource "aws_route_table" "modules_public_rt" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.gateway_id
  }

  tags = {
    Name = var.public_route_table_name
  }
}

resource "aws_route_table_association" "modules_public_rta" {
  subnet_id      = var.public_subnet_id
  route_table_id = aws_route_table.modules_public_rt.id
}

resource "aws_route_table" "modules_private_rt" {
  vpc_id = var.vpc_id

  route {
    cidr_block    = "0.0.0.0/0"
    nat_gateway_id = var.nat_gateway_id
  }

  tags = {
    Name = var.private_route_table_name
  }
}

resource "aws_route_table_association" "private" {
  subnet_id     = var.private_subnet_id
  route_table_id = aws_route_table.modules_private_rt.id
}