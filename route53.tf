
data "aws_instance" "web_instance" {
  instance_id = aws_instance.webapp.id
}

resource "aws_route53_record" "app_a_record" {
  zone_id = var.domain_zone_id
  name    = var.domain_name
  type    = "A"
  ttl     = 300
  records = [data.aws_instance.web_instance.public_ip]
  # alias {
  #   name                   = aws_lb.webapp_lb.dns_name # ALB DNS name
  #   zone_id                = aws_lb.webapp_lb.zone_id  # ALB Hosted Zone ID
  #   evaluate_target_health = true
  # }
}
