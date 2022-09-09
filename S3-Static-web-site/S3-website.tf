# website configuration
resource "aws_s3_bucket_website_configuration" "mybucket-website" {
  bucket = aws_s3_bucket.mybucket.bucket

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

}
