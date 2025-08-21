# Nueva forma de manejar ACL
# resource "aws_s3_bucket" "demo_bucket" {
#   bucket = "mi-bucket-demo-20773"

#   tags = {
#     Name        = "mi-bucket-demo-20773"
#     Environment = "dev"
#   }
# }

resource "aws_instance" "example" {
  ami = "ami-0b016c703b95ecbe4"
  instance_type = "t3.small"  
    tags = {
    Name = "Expedition 33"
  }
}

# resource "aws_instance" "cyberpunk" {
#   ami           = "ami-0b016c703b95ecbe4"
#   instance_type = "t3.small"

#   # Asignar un nombre visible en AWS
#   tags = {
#     Name = "cyberpunk"
#   }
# }

provider "aws" {
  region = "us-west-2"
}

module "ec2_cyberpunk" {
  source        = "./modules/ec2"
  ami           = "ami-0b016c703b95ecbe4"
  instance_type = "t3.small"
  name          = "cyberpunk"
}

output "cyberpunk_public_ip" {
  value = module.ec2_cyberpunk.public_ip
}

