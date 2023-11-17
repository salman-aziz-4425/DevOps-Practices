# Create DynamoDB table for state-locking
resource "aws_dynamodb_table" "dynamodb" {
  name         = "${var.env}-hyly-state-locking"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}