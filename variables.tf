variable "aws_region" {
  description = "Región de AWS donde desplegar"
  type        = string
}

variable "bucket_name" {
  description = "Nombre del bucket S3"
  type        = string
}

variable "environment" {
  description = "Ambiente (dev, qa, prod)"
  type        = string
}

########   VPC   ###########


variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnets" {
  description = "List of public subnet CIDRs"
  type        = list(string)
}

variable "private_subnets" {
  description = "List of private subnet CIDRs"
  type        = list(string)
}

variable "availability_zones" {
  description = "List of AZs where subnets will be created"
  type        = list(string)
}




##### RDS.  ######



variable "vpc_id" {
  type        = string
  description = "ID de la VPC existente"
}

variable "db_username" {
  type        = string
  description = "Usuario de la base de datos"
}

variable "db_password" {
  type        = string
  description = "Password de la base de datos"
  sensitive   = true
}