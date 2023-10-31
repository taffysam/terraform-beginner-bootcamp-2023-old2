

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

  tags = {
    Useruuid = var.user_uuid
  }
}

#resource "aws_s3_bucket" "website_bucket" {
#  bucket = var.bucket_name
#  tags = {
#    Useruuid = var.user_uuid
#  }
#}

