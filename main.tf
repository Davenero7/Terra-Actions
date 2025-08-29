module "vpc" {
  source = "./vpc"
}

module "ec2" {
  source           = "./ec2"
  vpc_id           = module.vpc.vpc_id
  public_subnet_id = module.vpc.public_subnet_id
  ami_id           = var.ami_id
  instance_type    = var.instance_type
}

variable "ami_id" {}
variable "instance_type" {}