variable "name" {
  type = string
  description = "(Required) Name of the repository."
}

variable "environment" {
  type = string
  description = "(Optional)Repository environment."
}

variable "image_tag_mutability" {
  type = string
  description = "(Optional)Tag mutability setting for the repository."
  default = "MUTABLE"
}

variable "scan_on_push" {
  type = bool
  description = "(Required) Indicates whether images are scanned after being pushed to the repository (true) or not scanned (false)."
  default = true
}

variable "additional_tags" {
  type = map(string)
  description = "(Optional) A map of tags to assign to the resource."
  default = {}
}


variable "expiration_after_days" {
  type = number
  description = "(Optional) Delete images older than X days."
  default = 0
}

variable "retain_minimum_images" {
  type = number
  description = "(Optional) Retain minimum of X images."
  default = 0
}
