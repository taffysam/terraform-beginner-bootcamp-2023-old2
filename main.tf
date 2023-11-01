terraform {
  
}

provider "terratowns" {
  endpoint  = var.terratowns_endpoint
  user_uuid = var.teacherseat_user_uuid
  token     = var.terratowns_access_token
}

#  module "terrahome_aws" {
#    source = "./modules/terrahome_aws"
#    user_uuid = var.user_uuid
#    bucket_name = var.bucket_name
#    error_html_file_path = var.error_html_file_path
#    index_html_file_path = var.index_html_file_path
#    public_path = var.public_path
#  }

