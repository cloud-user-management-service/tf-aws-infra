resource "aws_s3_bucket" "profile_image_bucket" {
  bucket = uuid()
  acl    = "private"

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = "aws:kms"
        kms_master_key_id = aws_kms_key.s3_encrypt_key.arn
      }
    }
  }

  lifecycle_rule {
    id      = "transition_to_ia"
    enabled = true

    transition {
      days          = 30
      storage_class = "STANDARD_IA"
    }
  }

  force_destroy = true
}

resource "aws_s3_bucket" "lambda_code_bucket" {
  bucket = uuid()
  acl    = "private"

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = "aws:kms"
        kms_master_key_id = aws_kms_key.s3_encrypt_key.arn
      }
    }
  }

  lifecycle_rule {
    id      = "transition_to_ia"
    enabled = true

    transition {
      days          = 30
      storage_class = "STANDARD_IA"
    }
  }

  force_destroy = true
}


