terraform {
  required_providers {
    terratowns = {
      source  = "local.providers/local/terratowns"
      version = "1.0.0"
    }
  }

  cloud {
   organization = "Tafadzwa"
   workspaces {
     name = "terrahome-1"
}
}
}

provider "terratowns" {
  endpoint  = var.terratowns_endpoint
  user_uuid = var.teacherseat_user_uuid
  token     = var.terratowns_access_token
}


  #module "terrahome_aws" {
  #  source = "./modules/terrahome_aws"
  #  user_uuid = var.user_uuid
  #  bucket_name = var.bucket_name
  #  public_path = var.hide_public_path
  #  error_html_file_path = var.error_html_file_path
  #  index_html_file_path = var.index_html_file_path
  #  assets_path = var.assets_path
  #  terratowns_access_token = var.terratowns_access_token
  #  terratowns_endpoint = var.terratowns_endpoint
  #}

module "home_compass" {
source = "./modules/terrahome_aws"
user_uuid = var.teacherseat_user_uuid
public_path = var.compass.public_path
content_version = var.compass.content_version
}


resource "terratowns_home" "compass" {
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
  #content_version = var.home_compass.content_version
  content_version = var.home_compass.content_version
}


module "home_hide" {
source = "./modules/terrahome_aws"
user_uuid = var.teacherseat_user_uuid
public_path = var.hide.public_path
  content_version = var.hide.content_version
}

resource "terratowns_home" "hide"{
  name = "How to play Hide and Seek"
  description = <<DESCRIPTION
Hide and seek is a classic outdoor game that is popular among children and is also enjoyed by people of all ages. Here are the basic rules and steps to play hide and seek:
Choose one player to be the "seeker." The other players will be the "hiders."
Decide on the boundaries or area where the game will be played. This area could be a backyard, a park, a house, or any other suitable location.
You can play with different rules or variations. For example, in some versions of the game, hiders can run back to the base without getting tagged by the seeker to avoid being "out."
Hide and seek is often played outdoors, but you can also play it indoors if you have a suitable space.
Make sure to set boundaries and establish safety rules to prevent players from going to unsafe areas or getting lost.
The game is not just for children; adults can also enjoy playing hide and seek for a fun and active social activity.
Be respectful and considerate of others while hiding. Don't hide in places that could cause harm or damage property.
DESCRIPTION
  domain_name = module.hide.domain_name
  town = "hide-seek"
  content_version = var.home_hide.content_version
}