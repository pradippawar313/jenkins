resource "aws_s3_bucket" "backend_bucket" {
    bucket = var.s3_bucket_name
}

resource "aws_s3_bucket_versioning" "s3_versioning" {
    bucket = aws_s3_bucket.backend_bucket.bucket
    versioning_configuration {
      status = "Enabled"
    }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "aws_sse" {
    bucket = aws_s3_bucket.backend_bucket.bucket
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  
}