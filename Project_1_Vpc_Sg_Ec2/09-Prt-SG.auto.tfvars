
# Private_Security_Group_Ingress 
Private_Security_Group_Ingress = {
  "22" = {
    cidr_blocks = ["10.0.0.0/16"]
    description = "Port for 22"
    port        = 22
    protocol    = "tcp"
  }
  "80" = {
    cidr_blocks = ["10.0.0.0/16"]
    description = "Port for 80"
    port        = 80
    protocol    = "tcp"
  }
}


# private_Security_Group_Name
private_Security_Group_Name = "private_Security_Group"