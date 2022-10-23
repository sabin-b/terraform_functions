# Elb Name
variable "Elb_Name" {
  type        = string
  description = "Elb_Name for Classical Load Balancer"
}

# Elb_availability_zones
variable "Elb_availability_zones" {
  type        = list(string)
  description = "Elb_availability_zones for Classical Load Balancer"
}

# Elb_Tags
variable "Elb_Tags" {
  type        = map(string)
  description = "Elb_Tags for Classical Load Balancer"
  default     = null
}

# Elb_Instances_Attach
variable "Elb_Instances_Attach" {
  type        = list(string)
  description = "Elb_Instances_Attach for Classical Load Balancer"
  default     = null
}

# Elb_security_group_id
variable "Elb_security_group_id" {
  type        = list(string)
  description = "Elb_security_group_id for Classical Load Balancer"
  default     = null
}

/*# classic load balancer listners
variable "listeners" {
  description = "A list of listener configurations for the ELB."
  type = list(object({
    lb_port: number
    lb_protocol: string
    instance_port: number
    instance_protocol: string
    #ssl_certificate_id: string
  }))
  default = [ {
    instance_port = 80
    instance_protocol = "HTTP"
    lb_port = 80
    lb_protocol = "HTTP"
  } ]
}*/