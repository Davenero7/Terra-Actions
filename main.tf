terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "mi-terraform-state"
    key            = "terraform.tfstate"
    region         = "us-east-2"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}

provider "aws" {
  region = "us-east-2"
}

# Llamar a los módulos
module "vpc" {
  source = "./vpc"
}

module "ec2" {
  source    = "./ec2"
  vpc_id    = module.vpc.vpc_id
  public_subnet_id = module.vpc.public_subnet_id
}