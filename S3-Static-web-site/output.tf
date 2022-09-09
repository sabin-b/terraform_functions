
output "name" {
  description = "Name (id) of the bucket"
  value       = aws_s3_bucket.mybucket.id
}

output "domain" {
  description = "Domain Name of the bucket"
  value       = aws_s3_bucket_website_configuration.mybucket-website.website_endpoint
}
