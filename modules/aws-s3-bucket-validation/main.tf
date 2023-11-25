resource "aws_s3_bucket" "validation_bucket" {
  bucket = var.bucket_name
  tags = var.tags
}

resource "aws_s3_bucket_public_access_block" "validation_bucket_public_access_block" {
  bucket = aws_s3_bucket.validation_bucket.bucket

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_cors_configuration" "validation_bucket_cors_configuration" {
  bucket = aws_s3_bucket.validation_bucket.bucket

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["PUT"]
    allowed_origins = [
      "http://localhost:3000", 
      "https://dev-front-end-pdf-2-qa.vercel.app"
    ]
    max_age_seconds = 3000
  }
}

resource "aws_s3_bucket_policy" "validation_bucket_policy" {
  bucket = aws_s3_bucket.validation_bucket.id
  policy = data.aws_iam_policy_document.validation_bucket_policy_document.json
}

data "aws_iam_policy_document" "validation_bucket_policy_document" {
  statement {
    principals {
      type        = "AWS"
      identifiers = ["109607957842"]
    }

    actions = [
      "s3:GetObject",
      "s3:PutObject",
    ]

    resources = [
      aws_s3_bucket.validation_bucket.arn,
      "${aws_s3_bucket.validation_bucket.arn}/*",
    ]
  }
}