# Private_Security_Group
variable "Private_Security_Group_Ingress" {
  type = map(object({
    description = string
    port        = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  description = "Private_Security_Group"
}


# private_Security_Group_Name
variable "private_Security_Group_Name" {
  type        = string
  description = "Private_Security_Group_Name"
}

