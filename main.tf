# Nueva forma de manejar ACL
resource "aws_s3_bucket" "demo_bucket" {
  bucket = "mi-bucket-demo-terraform-2025-dave"

  tags = {
    Name        = "mi-bucket-demo-terraform-2025-dave"
    Environment = "dev"
  }
}

resource "aws_instance" "example" {
  ami = "ami-0ad4621ea15a605ca"
  instance_type = "t2.micro"
  
}