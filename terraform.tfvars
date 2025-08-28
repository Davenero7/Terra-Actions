aws_region   = "us-east-1"
bucket_name  = "mi-bucket-demo-terraform-2026-davee"
environment  = "dev"


#####. VPC.  ######

aws_region        = "us-east-1"
vpc_cidr          = "10.0.0.0/16"
availability_zones = ["us-east-1a", "us-east-1b"]

public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnets = ["10.0.3.0/24", "10.0.4.0/24"]