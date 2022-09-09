# creating s3 bucket
resource "aws_s3_bucket" "mybucket" {
  bucket = local.bucket-name
  tags   = var.bucket-tags
  force_destroy = true
}


# locals
locals {
  bucket-name = join("-", [var.bucket-Name, var.Environment])
}

