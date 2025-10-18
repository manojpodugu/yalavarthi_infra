resource "aws_instance" "app" {
  count                     = 1
  ami                       = "ami-0360c520857e3138f"
  instance_type             = var.instance_type
  subnet_id                 = aws_subnet.public.id
  vpc_security_group_ids    = [aws_security_group.ec2_sg.id]
  key_name                  = var.key_name != "" ? var.key_name : null
  associate_public_ip_address = true
  # iam_instance_profile    = aws_iam_instance_profile.ec2_profile.name

  tags = {
    Name        = "${var.project_name}-${var.environment}-app"
    Environment = var.environment
    Project     = var.project_name
    ManagedBy   = "Terraform"
  }

  provisioner "local-exec" {
    when    = destroy
    command = "echo 'terraform destroy issued for instance ${self.id}'"
  }
}
