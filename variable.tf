variable "user_uuid" {
  description = "An example input variable with UUID validation"
  type        = string
  default     = "0071972e-6023-468b-9eab-4f109beb9e81"

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
  default = "public/error.html"
  validation {
    condition     = length(var.error_html_file_path) > 0
    error_message = "The specified error.html file path must not be empty."
  }
}

variable "index_html_file_path" {
  description = "Path to the index.html file"
  type        = string
 default = "public/index.html"
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

variable "public_path" {
  description = "The file path for the public directory"
  type        = string
  default     = "/public/index.html"

}

variable "teacherseat_user_uuid" {
  description = "An example input variable with UUID validation"
  type        = string
  default     = "0071972e-6023-468b-9eab-4f109beb9e81"

  validation {
    condition     = can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", var.teacherseat_user_uuid))
    error_message = "example_uuid must be a valid UUID. /modules/terrahouse_aws/variables.tf"
  }
}

variable "terratowns_access_token" {
  type = string
}

variable "terratowns_endpoint" {
  type = string
 
}

variable "content_version" {
  description = "Version number for your content"
  type        = number
  default =  2
}

variable "assets_path" {
  type        = string
  description = "Path to the assets folder"
  default = " /workspace/terraform-beginner-bootcamp-2023/public/assets"
}

#variable "home_compass" {
#  type = object({
#    public_path = string
#    content_version = number
#  })
#}

