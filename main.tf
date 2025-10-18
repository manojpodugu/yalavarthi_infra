###############################################
# Provider Configuration
###############################################
provider "aws" {
  region = var.aws_region
}

###############################################
# Security Group
###############################################
resource "aws_security_group" "nestjs_sg" {
  name        = "nestjs-sg"
  description = "Allow SSH, HTTP, and HTTPS access"
  vpc_id      = var.vpc_id

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "nestjs-security-group"
  }
}

###############################################
# EC2 Instance (Ubuntu)
###############################################
resource "aws_instance" "nestjs_ec2" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [aws_security_group.nestjs_sg.id]
  key_name               = var.key_name

  tags = {
    Name = "nestjs-app-server"
  }

 /* user_data = <<-EOF
              #!/bin/bash
              sudo apt update -y
              sudo apt install -y docker.io docker-compose
              sudo systemctl enable docker
              sudo systemctl start docker
              EOF */
}

###############################################
# Output Values
###############################################
output "ec2_public_ip" {
  description = "Public IP of the NestJS EC2 instance"
  value       = aws_instance.nestjs_ec2.public_ip
}

output "ec2_public_dns" {
  description = "Public DNS of the NestJS EC2 instance"
  value       = aws_instance.nestjs_ec2.public_dns
}
