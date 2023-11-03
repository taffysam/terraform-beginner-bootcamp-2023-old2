terraform {
     cloud {
   organization = "Tafadzwa"
   workspaces {
     name = "terrahome-1"
}
}

 }
# required_providers {
#
#    random = {
#    source = "hashicorp/random"
#    version = "3.5.1"
#
#    }
#
#    aws = {
#    source = "hashicorp/aws"
#    version = "5.16.2"
#
#    }
#    terratowns = {
#     source  = "local.providers/local/terratowns"
#     version = "1.0.0"
#    }
#  }
#}

provider "aws" {
  
}



