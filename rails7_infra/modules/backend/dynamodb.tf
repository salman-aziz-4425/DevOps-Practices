# Create DynamoDB table for state-locking
resource "aws_dynamodb_table" "qa_stage_dynamodb" {
  name         = "${var.env}-state-locking"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}