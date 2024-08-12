provider "aws" {
  region = var.region
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
  name   = var.sg_name
  ingress = var.ingress
  egress  = var.egress
}

module "instance" {
  source                 = "./modules/instance"
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  public_subnet_id       = module.subnet.public_subnet_id
  private_subnet_id     = module.subnet.private_subnet_id
  security_group_id      = module.security_group.security_group_id
  instance_public_count  = var.instance_public_count
  instance_private_count = var.instance_private_count
  public_name            = var.public_instance_name
  private_name           = var.private_instance_name
}