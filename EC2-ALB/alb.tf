# application load balancer creation
resource "aws_lb" "Myalb" {
  name               = join("-",[var.load-balancer-Name,element(var.Environment,0),var.region])
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb-security_group.id]
  #subnets            = [for subnet in  var.subnets: subnet.id]
  subnets = slice(var.subnets, 0, 3)
  enable_deletion_protection = false
  tags = merge(var.tags,var.alb_tags,{
    monitor = contains(["Dev", "Prod","Stage"],var.Environment) ? "cloudwatch" : ""
  })
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
      values = ["/Myapp/*"]
    }
  }
}

# application load balancer target-group-1
resource "aws_lb_target_group" "Myalb-tg-1" {
  name     = join("-",[var.load-balancer-Name,"target-group-1",element(var.Environment,0)])
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

# application load balancer target-group-attachment-1
resource "aws_lb_target_group_attachment" "Myalb-tg-attach-1" {
  target_group_arn = aws_lb_target_group.Myalb-tg-1.arn
  target_id        = aws_instance.myec2-1.id
  port             = 80
}


# application load balancer target-group-2
resource "aws_lb_target_group" "Myalb-tg-2" {
  name     = join("-",[var.load-balancer-Name,"target-group-2",element(var.Environment,0)])
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  
   health_check {
        enabled             = true
        healthy_threshold   = 5
        interval            = 30
        matcher             = "200"
        path                = "/Myapp/"
        port                = "traffic-port"
        protocol            = "HTTP"
        timeout             = 5
        unhealthy_threshold = 2
    }
}


# application load balancer target-group-attachment-2
resource "aws_lb_target_group_attachment" "Myalb-tg-attach-2" {
  target_group_arn = aws_lb_target_group.Myalb-tg-2.arn
  target_id        = aws_instance.myec2-2.id
  port             = 80
}

