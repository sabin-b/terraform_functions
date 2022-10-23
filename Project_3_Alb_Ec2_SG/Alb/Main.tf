# application load balancer creation
resource "aws_lb" "Myalb" {
  name               = var.load_balancer_Name
  internal           = false
  load_balancer_type = "application"
  security_groups    = var.alb_security_group
  #subnets            = [for subnet in  var.subnets: subnet.id]
  subnets = var.alb_subnets
  enable_deletion_protection = false
  tags = var.aws_lb_Tags
}


# application load balancer listner - 1
resource "aws_lb_listener" "Myalb-listner-1" {
  load_balancer_arn = aws_lb.Myalb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.Myalb-tg-1.arn
  }
}


# application load balancer listner - rule- 2
resource "aws_lb_listener_rule" "Myalb-listner-2" {
  listener_arn = aws_lb_listener.Myalb-listner-1.arn
  priority     = 100

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.Myalb-tg-2.arn
  }

  condition {
    path_pattern {
      values = ["/app1/*"]
    }
  }
}

# application load balancer target-group-1
resource "aws_lb_target_group" "Myalb-tg-1" {
  name     = "${var.load_balancer_Name}-tg-1"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.aws_lb_vpc_id
}

# application load balancer target-group-attachment-1
resource "aws_lb_target_group_attachment" "Myalb-tg-attach-1" {
  target_group_arn = aws_lb_target_group.Myalb-tg-1.arn
  target_id        = var.aws_lb_target_Instance_1_id
  port             = 80
}


# application load balancer target-group-2
resource "aws_lb_target_group" "Myalb-tg-2" {
  name     = "${var.load_balancer_Name}-tg-2"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.aws_lb_vpc_id
  
   health_check {
        enabled             = true
        healthy_threshold   = 5
        interval            = 30
        matcher             = "200"
        path                = "/app1/"
        port                = "traffic-port"
        protocol            = "HTTP"
        timeout             = 5
        unhealthy_threshold = 2
    }
}


# application load balancer target-group-attachment-2
resource "aws_lb_target_group_attachment" "Myalb-tg-attach-2" {
  target_group_arn = aws_lb_target_group.Myalb-tg-2.arn
  target_id        = var.aws_lb_target_Instance_2_id
  port             = 80
}

