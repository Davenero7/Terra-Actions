aws_region   = "us-east-2"
bucket_name  = "mi-bucket-demo-terraform-2026-davee"
environment  = "dev"


#####. VPC.  ######


vpc_cidr          = "10.0.0.0/16"
availability_zones = ["us-east-2a", "us-east-2b"]

public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnets = ["10.0.3.0/24", "10.0.4.0/24"]


# vpc_id      = "vpc-01a4f007410366aac"  # <-- tu VPC creada antes
# db_username = "admin"
# db_password = "SuperSecurePass123!"