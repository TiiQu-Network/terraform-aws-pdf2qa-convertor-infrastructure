# Input variable definitions

variable "bucket_name" {
  description = "Name of the s3 bucket. Must be unique."
  type        = string
  default     = "pdf2qa-convertor-validation-bucket"
}

variable "tags" {
  description = "Tags to set on the bucket."
  type        = map(string)
  default     = {
    Name        = "Validation Bucket"
    Environment = "dev"
  }
}
variable "lambda_processing_service_principle" {
  description = "Tags to set on the bucket."
  type        = string
  default     = "lambda.amazonaws.com" # update to the principle(s) for the lambdas in the processing service
}
