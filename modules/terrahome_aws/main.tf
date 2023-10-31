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

#resource "aws_s3_bucket" "website_bucket" {
#  bucket = random_string.bucket_name.result

#  tags = {
#    Useruuid = var.user_uuid
#  }
#}

resource "aws_s3_bucket" "website_bucket" {
  bucket = random_string.bucket_name.result
  tags = {
    Useruuid = var.user_uuid
  }
}


# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_website_configuration

resource "aws_s3_bucket_website_configuration" "website_configuration" {
bucket = aws_s3_bucket.website_bucket.bucket

index_document {
    suffix = "index.html"
 }

error_document {
    key = "error.html"
  }
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_object
resource "aws_s3_object" "index_html" {
  bucket = aws_s3_bucket.website_bucket.bucket
  key    = "index.html"
  #source = var.index_html_file_path
  content_type = "text/html"
  source = "${path.root}/public.index.html"
  
  #The filemd5() function is available in Terraform 0.11.12 and later
  #For Terraform 0.11.11 and earlier, use the md5() function and the file() function:
  #etag = file(var.index_html_file_path)
  #etag = filemd5("path/to/file")
}

resource "aws_s3_object" "error_html" {
  bucket = aws_s3_bucket.website_bucket.bucket
  key    = "error.html"
  #source = var.error_html_file_path
  content_type = "text/html"
  #etag = filemd5(var.error_html_file_path)
}

#resource "aws_s3_object" "upload_assets" {
#  #for_each = fileset("${var.public_path}/assets","*.{jpg,png,gif}")
#  bucket = aws_s3_bucket.website_bucket.bucket
#  key    = "assets/${each.key}"
# source = "${var.public_path}/assets/${each.key}"
# etag = filemd5("${var.public_path}/assets/${each.key}")
#  lifecycle {
 #   replace_triggered_by = [terraform_data.content_version.output]
#    ignore_changes = [etag]
#  }
#}


