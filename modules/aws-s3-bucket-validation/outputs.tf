# Output variable definitions

output "validation_bucket_arn" {
  description = "ARN of the bucket"
  value       = aws_s3_bucket.validation_bucket.arn
}
