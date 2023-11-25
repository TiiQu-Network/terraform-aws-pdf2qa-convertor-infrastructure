resource "aws_s3_bucket" "quarantine_bucket" {
  bucket = var.bucket_name
  tags = var.tags
}

resource "aws_s3_bucket_public_access_block" "quarantine_bucket_public_access_block" {
  bucket = aws_s3_bucket.quarantine_bucket.bucket

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_policy" "quarantine_bucket_policy" {
  bucket = aws_s3_bucket.quarantine_bucket.id
  policy = data.aws_iam_policy_document.quarantine_bucket_policy_document.json
}

data "aws_iam_policy_document" "quarantine_bucket_policy_document" {
  statement {
    principals {
      type        = "AWS"
      identifiers = ["109607957842"]
    }

    actions = [
      "s3:PutObject",
      "s3:DeleteObject",
    ]

    resources = [
      aws_s3_bucket.quarantine_bucket.arn,
      "${aws_s3_bucket.quarantine_bucket.arn}/*",
    ]
  }
}