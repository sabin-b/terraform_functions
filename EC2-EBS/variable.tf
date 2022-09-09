
# region
variable "region" {
  type        = string
  description = "instance region"
}

# key name
variable "key_name" {
  type        = string
  description = "key pair for ec2 instance"
}

# availability zone
variable "availability_zone" {
  type        = list(string)
  description = "ec2 instance availability zone"
}

# instance type
variable "instance_type" {
  type        = list(string)
  description = "ec2 instance types"
}

# package_name
variable "package_name" {
  type        = string
  description = "package installation name for ec2 instance"
}

# ec2-security_group
variable "ec2-security-group" {
  description = "ec2 instance security groups ingress ports"
  type = map(object({
    description = string
    port        = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}

# environment-tag
variable "environment" {
  type        = list(string)
  description = "resource are creating envirronment based"
}

# ec2-security-group-name
variable "ec2-security-group-name" {
  type        = string
  description = "ec2 instance security-group-name"
}

# vpc_id
variable "vpc_id" {
  type        = string
  description = "vpc id for security-group"
}

# ec2-tags
variable "ec2-tags" {
  type        = map(string)
  description = "ec2 instance tags"
}

# security-group-tags
variable "security-group-tags" {
  type        = map(string)
  description = "security-group-tags"
}

# ec2 instance-volumes
variable "instance-volumes" {
  description = "ec2 instance-volumes"
  type = map(string)
}
