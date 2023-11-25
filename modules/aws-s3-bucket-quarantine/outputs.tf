# Output variable definitions

output "quarantine_bucket_arn" {
  description = "ARN of the bucket"
  value       = aws_s3_bucket.quarantine_bucket.arn
}
