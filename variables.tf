###############################################
# AWS Configuration
###############################################
variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "ap-south-1"
}

###############################################
# EC2 Configuration
###############################################
variable "ami_id" {
  description = "Ubuntu AMI ID (change based on region)"
  type        = string
  default     = "ami-0c2af51e265bd5e0e" # Ubuntu 22.04 LTS in ap-south-1
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "Name of the AWS key pair for SSH access"
  type        = string
  default     = "nestjs-key"
}

###############################################
# Networking
###############################################
variable "vpc_id" {
  description = "VPC ID to launch the instance in"
  type        = string
  default     = "vpc-xxxxxxxx" # Replace with your actual VPC ID if known
}

variable "subnet_id" {
  description = "Subnet ID to launch the instance in"
  type        = string
  default     = "subnet-xxxxxxxx" # Replace with your subnet
}
