output "bucket_name" {
 value = aws_s3_bucket.website_bucket
 sensitive = true

}

output "s3_website_endpoint" {
      value = aws_s3_bucket_website_configuration.website_configuration
}