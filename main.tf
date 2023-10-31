terraform {

  cloud {
    organization = "Tafadzwa"

    workspaces {
      name = "terrahome-1"
    }
  }

  required_providers {

    random = {
    source = "hashicorp/random"
    version = "3.5.1"

    }

    aws = {
    source = "hashicorp/aws"
    version = "5.16.2"

    }
#    terratowns = {
#      source  = "local.providers/local/terratowns"
#      version = "1.0.0"
#    }
  }
}

provider "random" {

}

provider "aws" {

}


resource "random_id" "bucket" {
  byte_length = 8
}

resource "random_string" "bucket_name" {
    length = 32
    special = false
    lower = true
    upper = false 

}

# https://developer.hashicorp.com/terraform/language/modules/sources

resource "aws_s3_bucket" "example" {
  bucket = random_string.bucket_name.result
}

#resource "aws_s3_bucket" "website_bucket" {
#  bucket = var.bucket_name
#  tags = {
#    Useruuid = var.user_uuid
#  }
#}

