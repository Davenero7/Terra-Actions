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