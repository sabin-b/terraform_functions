# application load balancer dns
output "application_load_balancer_dns" {
  value = aws_lb.Myalb.dns_name
}