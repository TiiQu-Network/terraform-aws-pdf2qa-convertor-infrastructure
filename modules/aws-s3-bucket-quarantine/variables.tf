# Input variable definitions

variable "bucket_name" {
  description = "Name of the s3 bucket. Must be unique."
  type        = string
  default     = "pdf2qa-convertor-quarantine-bucket"
}

variable "tags" {
  description = "Tags to set on the bucket."
  type        = map(string)
  default     = {
    Name        = "Quarantine Bucket"
    Environment = "dev"
  }
}