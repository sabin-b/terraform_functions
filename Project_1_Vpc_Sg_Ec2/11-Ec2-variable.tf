# ami_id
/*variable "ami_id" {
  type = string
  description = "Ec2 instance for ami"
}*/


# instance_type
variable "instance_type" {
  type        = string
  description = "instance type for Ec2"
}


# key_name
variable "key_name" {
  type        = string
  description = "key_name for Ec2"
}


/*# subnet_id
variable "subnet_id" {
  type = list(string)
  description = "subnet_id for Ec2"
}


# vpc_security_group_ids
variable "vpc_security_group_ids" {
  type = list(string)
  description = "vpc_security_group_ids for Ec2"
}

# Ec2_Tags
variable "Ec2_Tags" {
  type = map(string)
  description = "Ec2_Tags for Ec2"
}*/