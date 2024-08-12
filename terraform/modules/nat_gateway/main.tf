resource "aws_eip" "ktb-samsam-eip" {
  domain = "vpc"

  tags = {
    Name = var.name
  }
}

resource "aws_nat_gateway" "ktb-samsam-nat" {
  allocation_id = aws_eip.ktb-samsam-eip.id
  subnet_id     = var.subnet_id

  tags = {
    Name = var.name
  }
}