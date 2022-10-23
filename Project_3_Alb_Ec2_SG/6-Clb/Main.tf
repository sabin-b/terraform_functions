# # Classical_Load_Balancer
# resource "aws_elb" "elb" {
#   name               = var.Elb_Name
#   availability_zones = var.Elb_availability_zones
#  /*listener {
#     {
#       instance_port     = 80
#       instance_protocol = "HTTP"
#       lb_port           = 80
#       lb_protocol       = "HTTP"
#     },
#     {
#       instance_port     = 80
#       instance_protocol = "HTTP"
#       lb_port           = 81
#       lb_protocol       = "HTTP"
#     },
#  }*/
#     dynamic "listener" {
#     for_each = var.listeners
#     content {
#       instance_port = listener.value.instance_port
#       instance_protocol = listener.value.instance_protocol
#       lb_port = listener.value.lb_port
#       lb_protocol = listener.value.lb_protocol
#       #ssl_certificate_id = listener.value.ssl_certificate_id
#     }
#   }

#   health_check {
#     healthy_threshold   = 2
#     unhealthy_threshold = 2
#     timeout             = 3
#     target              = "HTTP:80/"
#     interval            = 30
#   }
#   instances = var.Elb_Instances_Attach
#   cross_zone_load_balancing   = true
#   idle_timeout                = 400
#   connection_draining         = true
#   connection_draining_timeout = 400
#   tags                        = var.Elb_Tags
#   security_groups             = var.Elb_security_group_id

# }

/*resource "aws_elb_attachment" "baz" {
  elb      = aws_elb.elb.id
  instance = var.Elb_Instances_Attach
}*/

# Create a new load balancer
resource "aws_elb" "bar" {
  name               = var.Elb_Name
  availability_zones = var.Elb_availability_zones

  /*access_logs {
    bucket        = "foo"
    bucket_prefix = "bar"
    interval      = 60
  }*/

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  listener {
    instance_port      = 80
    instance_protocol  = "http"
    lb_port            = 81
    lb_protocol        = "http"
    #ssl_certificate_id = "arn:aws:iam::123456789012:server-certificate/certName"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/"
    interval            = 30
  }

  instances                   = var.Elb_Instances_Attach
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags = var.Elb_Tags
  security_groups = var.Elb_security_group_id
}
