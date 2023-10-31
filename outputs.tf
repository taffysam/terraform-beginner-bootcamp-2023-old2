output "bucket_name" {
    description = "Bucket name for our static website bucket"
    value = module.terrahome_aws.bucket_name
    sensitive = true

}