resource "aws_db_subnet_group" "main" {
  name       = "ktb-samsam-subnet-group"
  subnet_ids = [
    module.subnet.private_subnet_id,
    module.subnet.private_subnet_db_id
  ]

  tags = {
    Name = "ktb-samsam-subnet-group"
  }
}

resource "aws_db_instance" "database" {
  allocated_storage    = 20
  max_allocated_storage = 50
  engine               = "mariadb"
  engine_version       = "10.6"
  instance_class       = "db.t3.micro"
  db_name              = "ktb-samsam"
  username             = "ktb-samsam"
  password             = "ktb-samsam"
  parameter_group_name = "default.mariadb10.6"
  skip_final_snapshot  = true
  publicly_accessible  = false
  db_subnet_group_name = aws_db_subnet_group.main.name


  vpc_security_group_ids = [aws_security_group.db_sg.id]

  tags = {
    Name = "ktb-samsam-rds-mariadb"
  }
}

resource "aws_security_group" "db_sg" {
  name        = "allow_mariadb"
  description = "Allow MariaDB inbound traffic"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = [var.private_subnet.cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}