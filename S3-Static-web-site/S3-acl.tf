# bucket access control list 
resource "aws_s3_bucket_acl" "mybucket-acl" {
  bucket = aws_s3_bucket.mybucket.id
  acl    = element(var.access_control, 0)
}