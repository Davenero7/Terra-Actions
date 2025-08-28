# terraform {
#   required_version = ">= 1.5.0"
  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  
#   backend "s3" {
#     bucket         = "mi-terraform-state"
#     key            = "terraform.tfstate"
#     region         = "us-east-2" # Ohio
#     dynamodb_table = "terraform-locks"
#     encrypt        = true
#   }
# }

# provider "aws" {
#   region = "us-east-2"  # Ohio
# }