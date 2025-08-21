# Nueva forma de manejar ACL
resource "aws_s3_bucket" "demo_bucket" {
  bucket = "mi-bucket-demo-terraform-2026-daveee"

  tags = {
    Name        = "mi-bucket-demo-terraform-2026-daveee"
    Environment = "dev"
  }
}

resource "aws_instance" "example" {
  ami = "ami-0b016c703b95ecbe4"
  instance_type = "t3.small"  
}