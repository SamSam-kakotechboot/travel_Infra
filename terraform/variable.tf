variable "region" {
  description = "AWS 리전"
  type        = string
}



# VPC
variable "vpc_cidr" {
  description = "VPC의 CIDR 블록"
  type        = string
}

variable "vpc_name" {
  description = "VPC 이름"
  type        = string
}



# Internet Gateway
variable "igw_name" {
  description = "인터넷 게이트웨이 이름"
  type        = string
}



# Subnet
variable "public_subnet" {
  description = "퍼블릭 서브넷 설정"
  type = object({
    cidr = string
    az   = string
    name = string
  })
}

variable "private_subnet" {
  description = "프라이빗 서브넷 설정"
  type = object({
    cidr = string
    az   = string
    name = string
  })
}

variable "private_subnet_db" {
  description = "프라이빗 DB 서브넷 설정"
  type = object({
    cidr = string
    az   = string
    name = string
  })
}



# Nat Gateway
variable "nat_name" {
  description = "NAT 게이트웨이 이름"
  type        = string
}

variable "public_route_table_name" {
  description = "퍼블릭 라우트 테이블 이름"
  type        = string
}

variable "private_route_table_name" {
  description = "프라이빗 라우트 테이블 이름"
  type        = string
}



# Security Group
variable "sg_name" {
  description = "보안 그룹 이름"
  type        = string
}

variable "ingress" {
  description = "인그레스 규칙"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}

variable "egress" {
  description = "이그레스 규칙"
  type = object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  })
}



# Instance
variable "ami" {
  description = "인스턴스의 AMI ID"
  type        = string
}

variable "instance_type" {
  description = "인스턴스 유형"
  type        = string
}

variable "key_name" {
  description = "SSH 키 이름"
  type        = string
}

variable "instance_public_count" {
  description = "퍼블릭 인스턴스의 수"
  type        = number
}

variable "instance_private_count" {
  description = "프라이빗 인스턴스의 수"
  type        = number
}

variable "public_instance_name" {
  description = "퍼블릭 인스턴스 이름"
  type        = string
}

variable "private_instance_name" {
  description = "프라이빗 인스턴스 이름"
  type        = string
}



# RDS(Security Group)
variable "db_security_group_name" {
  description = "The name of the security group for the DB"
  type        = string
}
variable "db_security_group_description" {
  description = "The name of the security group for the DB"
  type        = string
}

variable "db_security_group_ingress_from_port" {
  description = "인그레스 규칙"
  type = number
}

variable "db_security_group_ingress_to_port" {
  description = "인그레스 규칙"
  type = number
}

variable "db_security_group_ingress_protocol" {
  description = "인그레스 규칙"
  type = string
}

variable "db_security_group_egress" {
  description = "이그레스 규칙"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}



# RDS(Subnet Group)
variable "db_subnet_group_name" {
  description = "The name of the DB subnet group"
  type        = string
}



# RDS(Instance)
variable "db_allocated_storage" {
  description = "The allocated storage for the DB instance"
  type        = number
}

variable "db_max_allocated_storage" {
  description = "The maximum allocated storage for the DB instance"
  type        = number
}

variable "db_engine" {
  description = "The database engine"
  type        = string
}

variable "db_engine_version" {
  description = "The version of the database engine"
  type        = string
}

variable "db_instance_class" {
  description = "The instance class for the DB instance"
  type        = string
}

variable "db_name" {
  description = "The username for the DB instance"
  type        = string
}

variable "db_username" {
  description = "The username for the DB instance"
  type        = string
}

variable "db_password" {
  description = "The password for the DB instance"
  type        = string
}

variable "db_parameter_group_name" {
  description = "The DB parameter group name"
  type        = string
}

variable "db_instance_name" {
  description = "The name of the DB instance"
  type        = string
}