# Bucket module variables
variable "vpc_state_bucket_name" {
  type = string
  description = "The name of the bucket, should be globally unique"
}

variable "vpc_state_bucket_location" {
  type = string
  description = "Where the bucket should be created"
}