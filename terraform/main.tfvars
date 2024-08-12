region = "ap-northeast-2"

vpc_cidr = "192.168.0.0/22"
vpc_name = "ktb-samsam-vpc"

igw_name = "ktb-samsam-igw"

public_subnet = {
  cidr = "192.168.1.0/24"
  az   = "ap-northeast-2a"
  name = "ktb-samsam-public-subnet"
}

private_subnet = {
    cidr = "192.168.2.0/24"
    az   = "ap-northeast-2a"
    name = "ktb-samsam-private-subnet"
}

nat_name = "ktb-samsam-nat"

public_route_table_name  = "ktb-samsam-public-rt"
private_route_table_name = "ktb-samsam-private-rt"

sg_name = "ktb-samsam-sg"

ingress = [
  {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  },
  {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  },
  {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
]

egress = {
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
}

ami                    = "ami-062cf18d655c0b1e8"
instance_type          = "t2.micro"
key_name               = "aws-ktb-key"

instance_public_count  = 1
instance_private_count = 1

public_instance_name = "ktb-samsam-FE"
private_instance_name = "ktb-samsam-BE"