resource "aws_sqs_queue" "pdf2qa_convertor_validation_queue" {
  name                       = "pdf2qa-convertor-validation-queue"
  redrive_policy             = "{\"deadLetterTargetArn\":\"${aws_sqs_queue.pdf2qa_convertor_validation_dl_queue.arn}\",\"maxReceiveCount\":5}"
  visibility_timeout_seconds = 300

    tags = {
        Environment = "dev"
    }
}

resource "aws_sqs_queue" "pdf2qa_convertor_validation_dl_queue" {
    name = "pdf2qa-convertor-validation-dl-queue"
}

resource "aws_sns_topic" "pdf2qa_convertor_file_status" {
    name = "pdf2qa-convertor-file-validation-status"
}

# subscribe our SQS queue to the SNS topic
resource "aws_sns_topic_subscription" "pdf2qa_convertor_sqs_target" {
    topic_arn = "${aws_sns_topic.pdf2qa_convertor_file_status.arn}"
    protocol  = "sqs"
    endpoint  = "${aws_sqs_queue.pdf2qa_convertor_validation_queue.arn}"
}

resource "aws_sqs_queue_policy" "rpdf2qa_convertor_validation_queue_policy" {
    queue_url = "${aws_sqs_queue.pdf2qa_convertor_validation_queue.id}"

    policy = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "sqspolicy",
  "Statement": [
    {
      "Sid": "First",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "sqs:SendMessage",
      "Resource": "${aws_sqs_queue.pdf2qa_convertor_validation_queue.arn}",
      "Condition": {
        "ArnEquals": {
          "aws:SourceArn": "${aws_sns_topic.pdf2qa_convertor_file_status.arn}"
        }
      }
    }
  ]
}
POLICY
}