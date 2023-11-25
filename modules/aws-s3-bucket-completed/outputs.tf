# Output variable definitions

output "completed_bucket_arn" {
  description = "ARN of the bucket"
  value       = aws_s3_bucket.completed_bucket.arn
}
