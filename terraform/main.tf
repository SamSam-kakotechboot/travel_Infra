provider "aws" {
  region = var.region
  profile = "ktb-samsam"
}

module "vpc" {
  source   = "./modules/vpc"
  cidr_block = var.vpc_cidr
  name     = var.vpc_name
}

module "internet_gateway" {
  source = "./modules/internet_gateway"
  vpc_id = module.vpc.vpc_id
  name   = var.igw_name
}

module "subnet" {
  source          = "./modules/subnet"
  vpc_id          = module.vpc.vpc_id
  public_subnet   = var.public_subnet
  private_subnet = var.private_subnet
  private_subnet_db = var.private_subnet_db
}

module "nat_gateway" {
  source    = "./modules/nat_gateway"
  subnet_id = module.subnet.public_subnet_id
  name      = var.nat_name
}

module "route_table" {
  source                   = "./modules/route_table"
  vpc_id                   = module.vpc.vpc_id
  gateway_id               = module.internet_gateway.igw_id
  public_subnet_id         = module.subnet.public_subnet_id
  nat_gateway_id           = module.nat_gateway.nat_gateway_id
  private_subnet_id       = module.subnet.private_subnet_id
  public_route_table_name  = var.public_route_table_name
  private_route_table_name = var.private_route_table_name
}

module "security_group" {
  source = "./modules/security_group"
  vpc_id = module.vpc.vpc_id
  name_fe   = var.sg_name_fe
  ingress_fe = var.ingress_fe
  name_be   = var.sg_name_be
  ingress_be = var.ingress_be
  name_db            = var.sg_name_db
  ingress_db = [
    {
      from_port   = var.ingress_db_from_port
      to_port     = var.ingress_db_to_port
      protocol    = var.ingress_db_protocol
      cidr_blocks = [var.private_subnet.cidr]
    }
  ]
  egress  = var.egress
}

module "instance" {
  source                 = "./modules/instance"
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  public_subnet_id       = module.subnet.public_subnet_id
  private_subnet_id     = module.subnet.private_subnet_id
  security_group_id_fe      = module.security_group.security_group_id-fe
  security_group_id_be      = module.security_group.security_group_id-be
  instance_public_count  = var.instance_public_count
  instance_private_count = var.instance_private_count
  public_name            = var.public_instance_name
  private_name           = var.private_instance_name
}


# RDS
module "db_subnet_group" {
  source = "./modules/subnet_group"

  db_subnet_group_name = var.db_subnet_group_name
  private_subnet_ids   = [
    module.subnet.private_subnet_id,
    module.subnet.private_subnet_db_id
  ]
}

module "db_instance" {
  source = "./modules/db_instance"

  allocated_storage      = var.db_allocated_storage
  max_allocated_storage  = var.db_max_allocated_storage
  engine                 = var.db_engine
  engine_version         = var.db_engine_version
  instance_class         = var.db_instance_class
  db_name                = var.db_name
  username               = var.db_username
  password               = var.db_password
  parameter_group_name   = var.db_parameter_group_name
  skip_final_snapshot    = true
  publicly_accessible    = false
  db_subnet_group_name   = module.db_subnet_group.db_subnet_group_name
  vpc_security_group_ids = [module.security_group.security_group_id]
  db_instance_name       = var.db_instance_name
}

module "ecr" {
  source = "./modules/ecr"

  ecr_be_name = var.ecr_be_name
  ecr_be_tag  = var.ecr_be_tag
  ecr_fe_name = var.ecr_fe_name
  ecr_fe_tag  = var.ecr_fe_tag
  ecr_scan    = var.ecr_scan
}