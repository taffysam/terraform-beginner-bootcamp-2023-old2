output "bucket_name" {
    description = "Bucket name for our static website bucket"
    value = module.terrahome_aws.bucket_name
    sensitive = true

}

output "s3_website_endpoint" {
    sensitive = true
    value = module.terrahome_aws.bucket_name
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

#output "s3bucket_website" {
#  description = "the value of the website/url that is produced for the s3 bucket."
#  value       = aws_s3_bucket_website_configuration.s3website.website_endpoint
#}

#output "domain_name" {
#  value = aws_cloudfront_distribution.s3_distribution.domain_name
#}