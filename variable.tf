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


variable "error_html_file_path" {
  description = "Path to the index.html file"
  type        = string
  default = "Yo have reached the error Page"
  validation {
    condition     = length(var.error_html_file_path) > 0
    error_message = "The specified error.html file path must not be empty."
  }
}


variable "index_html_file_path" {
  description = "Path to the index.html file"
  type        = string
  default = "Thanks for reaching our page"
  validation {
    condition     = length(var.index_html_file_path) > 0
    error_message = "The specified index.html file path must not be empty."
  }
}

resource "null_resource" "validate_file_path" {
  triggers = {
    index_html_file_path = var.index_html_file_path
    error_html_file_path = var.error_html_file_path
  }

}




#variable "teacherseat_user_uuid" {
#  description = "An example input variable with UUID validation"
#  type        = string
#  #default     = "0071972e-6023-468b-9eab-4f109beb9e81"
#
#  validation {
#    condition     = can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", var.teacherseat_user_uuid))
#    error_message = "example_uuid must be a valid UUID. /modules/terrahouse_aws/variables.tf"
#  }
#}

