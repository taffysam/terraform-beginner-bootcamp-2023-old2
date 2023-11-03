output "bucket_name" {
    description = "Bucket name for our static website bucket"
    #value = module.terrahome_aws.bucket_name
    value = module.home_compass.bucket_name
    sensitive = true

}

#output "bucket_name" {
# value = aws_s3_bucket.website_bucket
# sensitive = true
#}

#output "s3_website_endpoint" {
#      value = aws_s3_bucket_website_configuration.website_configuration
#}

#output "s3_bucket_name" {
#  description = "Value that is unique."
#  value       = aws_s3_bucket.website_bucket.id
#}

output "user_uuid" {
  description = "Value that is unique."
  value       = var.user_uuid
  sensitive = true
}

output "s3bucket_website" {
 description = "the value of the website/url that is produced for the s3 bucket."
 value       = module.compass.s3bucket_website
}

#output "domain_name" {
#  value = aws_cloudfront_distribution.s3_distribution.domain_name
#}