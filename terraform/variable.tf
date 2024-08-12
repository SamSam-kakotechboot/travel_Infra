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



# RDS
variable "db_name" {
  description = "디비 이름"
  type        = string
}

variable "master_username" {
  description = "유저 이름"
  type        = string
}

variable "master_password" {
  description = "유저 비밀 번호"
  type        = string
}

variable "db_instance_type" {
  description = "디비 인스턴스 타입"
  type        = string
}

variable "db_engine_version" {
  description = "퍼블릭 인스턴스 이름"
  type        = string
}