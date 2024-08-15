region = "ap-northeast-2"


# VPC
vpc_cidr = "192.168.0.0/22"
vpc_name = "ktb-samsam-vpc"


# Internet Gateway
igw_name = "ktb-samsam-igw"


# Subnet
public_subnet = {
  cidr = "192.168.1.0/24"
  az   = "ap-northeast-2a"
  name = "ktb-samsam-fe-subnet"
}

private_subnet = {
    cidr = "192.168.2.0/24"
    az   = "ap-northeast-2a"
    name = "ktb-samsam-be-subnet"
}

private_subnet_db = {
    cidr = "192.168.3.0/24"
    az   = "ap-northeast-2c"
    name = "ktb-samsam-db-subnet"
}


# Nat Gateway
nat_name = "ktb-samsam-nat"



# Route Table
public_route_table_name  = "ktb-samsam-public-rt"
private_route_table_name = "ktb-samsam-private-rt"


# Security Group
sg_name_fe = "ktb-samsam-sg_fe"
sg_name_be = "ktb-samsam-sg_be"

ingress_fe = [
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

ingress_be = [
  {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  },
  {
    from_port   = 8080
    to_port     = 8080
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



# Instance
ami                    = "ami-062cf18d655c0b1e8"
#instance_type          = "t2.medium"
key_name               = "aws-ktb-key"

instance_public_count  = 1
instance_private_count = 1

public_instance_name = "ktb-samsam-FE"
private_instance_name = "ktb-samsam-BE"


# RDS
db_security_group_name = "allow_mariadb"
db_security_group_description = "Allow inbound traffic for MariaDB"
db_security_group_ingress_from_port = 3306
db_security_group_ingress_to_port =  3306
db_security_group_ingress_protocol = "tcp"

db_security_group_egress = [
  {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
]

db_subnet_group_name = "ktb-samsam-subnet-group"



db_allocated_storage = 20
db_max_allocated_storage = 50
db_engine = "mariadb"
db_engine_version = "10.6"
#db_instance_class = "db.t3.medium"
db_name = "ktb_samsam_27"
db_username = "ktb_samsam_27"
db_password = "ktb_samsam_27"
db_parameter_group_name = "default.mariadb10.6"
db_instance_name = "ktb-samsam-rds-mariadb"