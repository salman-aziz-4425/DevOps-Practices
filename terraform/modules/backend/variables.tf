# Bucket module variables
variable "state_bucket_name" {
  type = string
  description = "The name of the bucket, should be globally unique"
}

variable "state_bucket_location" {
  type = string
  description = "Where the bucket should be created"
}