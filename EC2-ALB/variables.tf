# region
variable "region" {
  type        = string
  description = "resources going to create this region"
}

# instance type
variable "instance_type" {
  type        = string
  description = "ec2 instance type"
}

# availablity zone
variable "availability_zone" {
  type        = list(string)
  description = "ec2  instance availability_zone"
}

# key_name
variable "key_name" {
  type        = string
  description = "key pair for ec2 instance"
}
#tags
variable "tags" {
  type        = map(string)
  description = "ec2 instance tags"
}

# security-group
variable "ec2-security-group" {
  type = map(object({
    description = string
    port        = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}

# vpc_id
variable "vpc_id" {
  type        = string
  description = "default vpc"
}


###### application load balancer variables

# load_balancer_Name
variable "load-balancer-Name" {
  type = string
  description = "application load balancer name"
}




# Environment

variable "Environment" {
  type = list(string)
  description = "environment for application load balancer"
}


# subnet ids

variable "subnets" {
  type = list(string)
  description = "subnets for availability"
}

# alb tags
variable "alb_tags" {
  type = map(string)
  description = "application load balancer tags"
}