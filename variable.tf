variable "user_uuid" {
  description = "An example input variable with UUID validation"
  type        = string
  default     = "87e8fc20-5f21-4b38-872b-ab8adfb49ed5"

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
  default = "/workspace/terraform-beginner-bootcamp-2023/public/assets"
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