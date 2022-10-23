# load_balancer_Name
variable "load_balancer_Name" {
  type = string
  description = "application load balancer name"
}

# 
# alb-security_group
variable "alb_security_group" {
  type = list(string)
  description = "alb-security_group"
}

# alb_subnets
variable "alb_subnets" {
  type = list(string)
  description = "alb_subnets"
}

# aws_lb_Tags
variable "aws_lb_Tags" {
    type = map(string)
    description = "aws_lb_Tags"
    default = null
}

# aws_lb_vpc_id
variable "aws_lb_vpc_id" {
  type = string
  description = "aws_lb_vpc_id"
}

# aws_lb_target_Instance_1_id
variable "aws_lb_target_Instance_1_id" {
  type = string
  description = "aws_lb_target_Instance_1_id"
}

# aws_lb_target_Instance_2_id
variable "aws_lb_target_Instance_2_id" {
  type = string
  description = "aws_lb_target_Instance_2_id"
}