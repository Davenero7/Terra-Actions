# output "bucket_name" {
#   value = aws_s3_bucket.demo_bucket.bucket
# }

# output "bucket_arn" {
#   value = aws_s3_bucket.demo_bucket.arn
# }

output "vpc_id" {
  value = aws_vpc.this.id
}

output "public_subnets_ids" {
  value = [for s in aws_subnet.public : s.id]
}

output "private_subnets_ids" {
  value = [for s in aws_subnet.private : s.id]
}

output "internet_gateway_id" {
  value = aws_internet_gateway.this.id
}