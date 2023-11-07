# Create S3 bucket to hold the state
resource "aws_s3_bucket" "qa_stage_s3" {
  bucket        = "${var.env}-hyly-remote-state"
  force_destroy = true
}

# Enable versioning on the S3 bucket
resource "aws_s3_bucket_versioning" "qa_stage_s3_versioning" {
  bucket = aws_s3_bucket.qa_stage_s3.id
  versioning_configuration {
    status = "Enabled"
  }
}

# Add rule for SSL
resource "aws_s3_bucket_server_side_encryption_configuration" "qa_stage_s3_encryption" {
  bucket = aws_s3_bucket.qa_stage_s3.bucket
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}