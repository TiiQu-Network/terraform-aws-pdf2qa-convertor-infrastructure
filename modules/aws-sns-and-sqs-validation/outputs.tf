output "validation_queue_url" {
  description = "The URL of the validation SQS queue"
  value = aws_sqs_queue.pdf2qa_convertor_validation_queue.url
}

output "validation_queue_arn" {
  description = "The ARN of the validation SQS queue"
  value = aws_sqs_queue.pdf2qa_convertor_validation_queue.arn
}

output "validation_topic_arn" {
  description = "The ARN of the validation SNS queue"
  value = aws_sns_topic.pdf2qa_convertor_file_status.arn
}