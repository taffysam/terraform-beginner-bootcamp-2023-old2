
terraform {

#    terratowns = {
#      source  = "local.providers/local/terratowns"
#      version = "1.0.0"
#    }
  }

  module "terrahome_aws" {
    source = "./modules/terrahome_aws"
    user_uuid = var.user_uuid
    bucket_name = var.bucket_name
  }

