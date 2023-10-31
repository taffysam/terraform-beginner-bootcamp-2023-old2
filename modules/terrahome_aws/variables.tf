variable "user_uuid" {
  description = "An example input variable with UUID validation"
  type        = string
  #default     = "0071972e-6023-468b-9eab-4f109beb9e81"

  validation {
    condition     = can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", var.user_uuid))
    error_message = "example_uuid must be a valid UUID. /modules/terrahouse_aws/variables.tf"
  }
}

variable "bucket_name" {
    type    = string
    description = "Name of the S3 bucket for the static website"
    default     = "default-bucket-name"
    }

