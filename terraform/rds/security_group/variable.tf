variable "name" {
  description = "The name of the security group for the DB"
  type        = string
}

variable "description" {
  description = "The name of the security group for the DB"
  type        = string
}

variable "vpc_id" {
  description = "The name of the security group for the DB"
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
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}