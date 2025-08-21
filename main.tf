# Nueva forma de manejar ACL
resource "aws_s3_bucket" "demo_bucket" {
  bucket = "mi-bucket-demo-20773"

  tags = {
    Name        = "mi-bucket-demo-20773"
    Environment = "dev"
  }
}

resource "aws_instance" "example" {
  ami = "ami-0b016c703b95ecbe4"
  instance_type = "t3.small"  
}

terraform {
  required_version = ">= 1.7.0"

  backend "s3" {
    bucket         = "mi-bucket-demo-terraform-2027-dave"
    key            = "proyecto/terraform.tfstate"
    region         = "us-east-2"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}