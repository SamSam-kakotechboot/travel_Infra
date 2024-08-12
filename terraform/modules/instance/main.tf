resource "aws_instance" "ktb-samsam-public-instance" {
  count                  = var.instance_public_count
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = var.public_subnet_id
  associate_public_ip_address = true
  vpc_security_group_ids = [var.security_group_id]

  tags = {
    Name = var.public_name
  }
}

resource "aws_instance" "ktb-samsam-private-instance" {
  count                  = var.instance_private_count
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = var.private_subnet_id
  vpc_security_group_ids = [var.security_group_id]

  tags = {
    Name = var.private_name
  }
}