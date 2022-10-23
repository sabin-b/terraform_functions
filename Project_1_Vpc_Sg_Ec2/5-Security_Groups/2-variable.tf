# vpc_id
variable "vpc_id" {
  type = string
  description = "Vpc Id For Private_Security_Group"
}



# Private_Security_Group
variable "Ingress_For_Security_Group" {
type = map(object({
    description = string
    port        = number
    protocol    = string
    cidr_blocks = list(string)
  }))
    description = "Private_Security_Group"
}


# Security_Group_Name
variable "Security_Group_Name" {
  type = string
  description = "Security_Group_Name"
}


# Security_Group_Name
variable "Security_Group_Tags" {
  type = map(string)
  description = "Security_Group_Tags"
}