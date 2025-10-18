output "public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.app[*].public_ip
}
output "public_dns" {
  description = "Public DNS name of the EC2 instance"
  value       = aws_instance.app[*].public_dns
}

output "s3_bucket" {
  description = "S3 bucket created for backups/static files"
  value       = aws_s3_bucket.backups.bucket
}

output "vpc_id" {
  description = "VPC ID created"
  value       = aws_vpc.main.id
}

output "subnet_id" {
  description = "Subnet ID created"
  value       = aws_subnet.public.id
}

output "instance_profile" {
  description = "IAM instance profile attached to EC2 (for S3 access)"
  value       = aws_iam_instance_profile.ec2_profile.name
}

output "app_url" {
  description = "Suggested app URL (set DNS to this IP)"
  value       = "https://${var.app_subdomain}.${var.domain}"
}
