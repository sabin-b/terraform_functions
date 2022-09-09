# bucket-Name
variable "bucket-Name" {
  type        = string
  description = "bucket name"
}

# Environment
variable "Environment" {
  type        = string
  description = "Environment Name"
}

# tags
variable "bucket-tags" {
  type        = map(string)
  description = "s3 bucket tags"
}

# access_control
variable "access_control" {
  type        = list(string)
  description = "bucket access control"
}

# region
variable "region" {
  type        = string
  description = "instance region"
}