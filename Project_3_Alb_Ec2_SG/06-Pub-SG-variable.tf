# Public_Security_Group
variable "Public_Security_Group_Ingress" {
  type = map(object({
    description = string
    port        = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  description = "Public_Security_Group"
}


# public_Security_Group_Name
variable "public_Security_Group_Name" {
  type        = string
  description = "Public_Security_Group_Name"
}

