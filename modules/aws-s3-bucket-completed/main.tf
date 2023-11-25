resource "aws_s3_bucket" "completed_bucket" {
  bucket = var.bucket_name
  tags = var.tags
}

resource "aws_s3_bucket_public_access_block" "completed_bucket_public_access_block" {
  bucket = aws_s3_bucket.completed_bucket.bucket

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_cors_configuration" "completed_bucket_cors_configuration" {
  bucket = aws_s3_bucket.completed_bucket.bucket

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["GET"]
    allowed_origins = [
      "http://localhost:3000", 
      "https://dev-front-end-pdf-2-qa.vercel.app"
    ]
    max_age_seconds = 3000
  }
}

resource "aws_s3_bucket_policy" "completed_bucket_policy" {
  bucket = aws_s3_bucket.completed_bucket.id
  policy = data.aws_iam_policy_document.completed_bucket_policy_document.json
}

data "aws_iam_policy_document" "completed_bucket_policy_document" {
  statement {
    principals {
      type        = "AWS"
      identifiers = ["109607957842"]
    }

    actions = [
      "s3:PutObject",
      "s3:GetObject",
      "s3:DeleteObject",
    ]

    resources = [
      aws_s3_bucket.completed_bucket.arn,
      "${aws_s3_bucket.completed_bucket.arn}/*",
    ]
  }
}