# Output variable definitions

output "root_vpc_public_subnets" {
  description = "IDs of the VPC's public subnets"
  value = module.vpc.vpc_public_subnets
}

output "root_validation_sqs_queue_url" {
  description = "The URL of the validation SQS queue"
  value = module.aws-sns-and-sqs-validation.validation_queue_url
}

output "root_validation_queue_arn" {
  description = "The ARN of the validation SQS queue"
  value = module.aws-sns-and-sqs-validation.validation_queue_arn
}

output "root_validation_topic_arn" {
  description = "The ARN of the validation SNS queue"
  value = module.aws-sns-and-sqs-validation.validation_topic_arn
}

output "root_processing_sqs_queue_url" {
  description = "The URL of the processing SQS queue"
  value = module.aws-sns-and-sqs-processing.processing_queue_url
}

output "root_processing_queue_arn" {
  description = "The ARN of the processing SQS queue"
  value = module.aws-sns-and-sqs-processing.processing_queue_arn
}

output "root_processing_topic_arn" {
  description = "The ARN of the processing SNS queue"
  value = module.aws-sns-and-sqs-processing.processing_topic_arn
}