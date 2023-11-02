terraform {
  required_providers {
    terratowns = {
      source  = "local.providers/local/terratowns"
      version = "1.0.0"
    }
  }
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


resource "terratowns_home" "home" {
name = "How to play Compass Game"
  description = <<DESCRIPTION
- Type commands to interact with the game. For example, you can type "go north," "examine the chest," or "talk to the merchant."
- Your choices matter! Think carefully before making decisions.
- Save your progress by typing "save" at any time.
- To quit the game, type "quit."
Enjoy your adventure, and may you find the treasures that await you in AdventureQuest!
DESCRIPTION
  domain_name = module.home_compass.domain_name
  town = "missingo"
  content_version = var.home_compass.content_version
}


module "home_compass" {
source = "./modules/terrahome_aws"
user_uuid = var.teacherseat_user_uuid
public_path = var.public_path
error_html_file_path = var.error_html_file_path
index_html_file_path = var.index_html_file_path
bucket_name = var.bucket_name
#context_version = var.content_version
}
