variable "ami" {
  type        = string
  description = "AMI de la instancia"
}

variable "instance_type" {
  type        = string
  description = "Tipo de instancia"
  default     = "t3.micro"
}

variable "name" {
  type        = string
  description = "Cyberpunk"
}