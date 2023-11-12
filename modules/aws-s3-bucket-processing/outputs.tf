# Output variable definitions

output "processing_bucket_arn" {
  description = "ARN of the bucket"
  value       = aws_s3_bucket.processing_bucket.arn
}
