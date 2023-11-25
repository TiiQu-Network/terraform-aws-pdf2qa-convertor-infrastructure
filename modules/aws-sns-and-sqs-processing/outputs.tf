output "processing_queue_url" {
  description = "The URL of the processing SQS queue"
  value = aws_sqs_queue.pdf2qa_convertor_processing_queue.url
}

output "processing_queue_arn" {
  description = "The ARN of the processing SQS queue"
  value = aws_sqs_queue.pdf2qa_convertor_processing_queue.arn
}

output "processing_topic_arn" {
  description = "The ARN of the processing SNS queue"
  value = aws_sns_topic.pdf2qa_convertor_file_status.arn
}