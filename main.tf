terraform {
  required_providers {

    random = {
    source = "hashicorp/random"
    version = "3.5.1"

    }
#    terratowns = {
#      source  = "local.providers/local/terratowns"
#      version = "1.0.0"
#    }
  }
}

provider "random" {

}

resource "random_id" "bucket" {
  byte_length = 8
}


resource "random_string" "bucket_name" {
    length = 16
    special = false  
        
  
}

# https://developer.hashicorp.com/terraform/language/modules/sources
