# s3.tf

resource "aws_s3_bucket" "backups" {
  bucket = my-backup-bucket-${var.project_name}-${var.environment}-${random_id.bucket_suffix.hex}"
  tags = {
    Name        = "backup-bucket"
    Environment = "prod"
  }
}

resource "aws_s3_bucket_acl" "backups_acl" {
  bucket = aws_s3_bucket.backups.id
  acl    = "private"
}

resource "aws_s3_bucket_lifecycle_configuration" "backups_lifecycle" {
  bucket = aws_s3_bucket.backups.id

  rule {
    id     = "cleanup-old-backups"
    status = "Enabled"

    expiration {
      days = 30
    }
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "backups_sse" {
  bucket = aws_s3_bucket.backups.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_versioning" "backups_versioning" {
  bucket = aws_s3_bucket.backups.id

  versioning_configuration {
    status = "Enabled"
  }
}
