resource "aws_s3_bucket" "bucket" {
  bucket = "beryjuorg-ses-forward-prod"
}

resource "aws_s3_bucket_lifecycle_configuration" "expire" {
  bucket = aws_s3_bucket.bucket.id

  rule {
    id     = "month"
    status = "Enabled"

    abort_incomplete_multipart_upload {
      days_after_initiation = 1
    }

    expiration {
      days = 30
    }

    noncurrent_version_expiration {
      newer_noncurrent_versions = "1"
      noncurrent_days           = 30
    }
  }
}
