output "bucket_id" {
  value = aws_s3_bucket.s3_bucket.id
}

output "dynamodb_table_id" {
  value = aws_dynamodb_table.dynamodb.id
}