# Clb_Security_Group_Ingress 
Clb_Security_Group_Ingress = {
  "80" = {
    cidr_blocks = ["0.0.0.0/0"]
    description = "Port for 80"
    port        = 80
    protocol    = "tcp"
  }
  "81" = {
    cidr_blocks = ["0.0.0.0/0"]
    description = "Port for 81"
    port        = 81
    protocol    = 6
  }
}


# Clb_Security_Group_Name
Clb_Security_Group_Name = "Alb_Security_Group"