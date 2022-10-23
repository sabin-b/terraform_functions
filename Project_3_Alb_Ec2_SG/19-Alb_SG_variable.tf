# Clb_Security_Group_Name
variable "Clb_Security_Group_Ingress" {
  type = map(object({
    description = string
    port        = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  description = "Clb_Security_Group_Ingress"
}


# Clb_Security_Group_Name
variable "Clb_Security_Group_Name" {
  type        = string
  description = "Clb_Security_Group_Name"
}

