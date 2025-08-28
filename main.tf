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
  region = "us-east-2"
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

########## VPC  ######


# Crear VPC
resource "aws_vpc" "this" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "my-vpc"
  }
}

#nueva infra
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  lifecycle {
    prevent_destroy = true
  }

  tags = {
    Name = "my-vpc"
  }
}

# Crear Subnets Públicas
resource "aws_subnet" "public" {
  for_each          = toset(var.public_subnets)
  vpc_id            = aws_vpc.this.id
  cidr_block        = each.value
  availability_zone = element(var.availability_zones, index(var.public_subnets, each.value))

  tags = {
    Name = "public-subnet-${each.key}"
  }
}

# Crear Subnets Privadas
resource "aws_subnet" "private" {
  for_each          = toset(var.private_subnets)
  vpc_id            = aws_vpc.this.id
  cidr_block        = each.value
  availability_zone = element(var.availability_zones, index(var.private_subnets, each.value))

  tags = {
    Name = "private-subnet-${each.key}"
  }
}

# Crear Internet Gateway
resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "my-vpc-igw"
  }
}

# Crear Route Table Pública
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }

  tags = {
    Name = "public-rt"
  }
}

# # Asociar Subnets Públicas a la Route Table
# resource "aws_route_table_association" "public_assoc" {
#   for_each       = aws_subnet.public
#   subnet_id      = each.value.id
#   route_table_id = aws_route_table.public.id
# }


# # Data para usar la VPC ya creada
# data "aws_vpc" "selected" {
#   id = var.vpc_id
# }

# # Data para usar subnets ya creadas en esa VPC
# data "aws_subnets" "selected" {
#   filter {
#     name   = "vpc-id"
#     values = [var.vpc_id]
#   }
# }

# # Security group para RDS
# resource "aws_security_group" "rds_sg" {
#   name        = "rds-security-group"
#   description = "Permitir acceso MySQL"
#   vpc_id      = var.vpc_id

#   ingress {
#     description = "MySQL"
#     from_port   = 3306
#     to_port     = 3306
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"] # ⚠️ Abierto a todos (solo para pruebas)
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }

# # Subnet group para RDS
# resource "aws_db_subnet_group" "rds_subnets" {
#   name       = "rds-subnet-group"
#   subnet_ids = data.aws_subnets.selected.ids
#   tags = {
#     Name = "rds-subnet-group"
#   }
# }

# # RDS Instance
# resource "aws_db_instance" "mysql" {
#   allocated_storage    = 20
#   engine               = "mysql"
#   engine_version       = "8.0"
#   instance_class       = "db.t3.micro"
#   identifier           = "my-rds-mysql"
#   username             = var.db_username
#   password             = var.db_password
#   db_subnet_group_name = aws_db_subnet_group.rds_subnets.name
#   vpc_security_group_ids = [aws_security_group.rds_sg.id]

#   skip_final_snapshot = true # ⚠️ evita snapshot al borrar (solo pruebas)
# }