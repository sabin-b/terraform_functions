# application load balancer dns
output "application_load_balancer_dns" {
  value = module.Alb.application_load_balancer_dns
}