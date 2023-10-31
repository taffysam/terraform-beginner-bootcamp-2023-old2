output "random_bucket_name" {
 value = random_string.bucket_name.result
  
}

#output "s3_website_endpoint" {
#  value = module.terrahouse_aws.cloudfront_url
#}
