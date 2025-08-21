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