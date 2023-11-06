output "bucket_id" {
  value = aws_s3_bucket.qa_stage_s3.id
}

output "dynamodb_table_id" {
  value = aws_dynamodb_table.qa_stage_dynamodb.id
}