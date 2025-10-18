terraform {
  required_version = ">= 1.2.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

# All variables (kept here by your requirement)
variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Project prefix used in resource names"
  type        = string
  default     = "nestjs-app"
}

variable "environment" {
  description = "Deployment environment identifier"
  type        = string
  default     = "prod"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "EC2 key pair name for SSH (leave empty to skip)"
  type        = string
  default     = "yalavarthi"
}

variable "admin_ip_cidr" {
  description = "CIDR block allowed to SSH (override to restrict)"
  type        = string
  default     = "0.0.0.0/0"
}

variable "domain" {
  description = "Root domain used for app URL outputs"
  type        = string
  default     = "example.com"
}

variable "app_subdomain" {
  description = "App subdomain for outputs"
  type        = string
  default     = "app"
}

variable "cloud_init_file" {
  description = "Optional path to a user-supplied cloud-init script (relative to module)"
  type        = string
  default     = ""
}
