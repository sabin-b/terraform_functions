# policy for s3 bucket
resource "aws_s3_bucket_policy" "bucket-policy" {
  bucket = aws_s3_bucket.mybucket.id
  policy = file("policy.json")
}