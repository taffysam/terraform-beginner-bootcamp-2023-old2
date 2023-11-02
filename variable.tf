variable "user_uuid" {
  description = "An example input variable with UUID validation"
  type        = string
  default     = "0071972e-6023-468b-9eab-4f109beb9e81"

  validation {
    condition     = can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", var.user_uuid))
    error_message = "example_uuid must be a valid UUID. /modules/terrahouse_aws/variables.tf"
  }
}

variable "terratowns_access_token" {
  type = string
}

variable "terratowns_endpoint" {
  type = string
}

variable "teacherseat_user_uuid" {
  type = string
}

variable "index_html_path" {
  type = string
}

variable "error_html_path" {
  type = string
}

variable "content_version" {
  description = "Version number for your content"
  type        = number
}

variable "assets_path" {
  type        = string
  description = "Path to the assets folder"
}


variable "hide" {
  type = object({
    public_path = string
    content_version = number
  })
}

variable "compass" {
  type = object({
    public_path = string
    content_version = number
  })
}