resource "aws_lb" "webapp_lb" {
  name               = "webapp-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lb_sg.id]
  subnets            = [aws_subnet.csye6225_public_subnet_1.id, aws_subnet.csye6225_public_subnet_2.id, ]

  enable_deletion_protection = false

  tags = {
    Name = "webapp-lb"
  }
}

resource "aws_lb_listener" "http_listener" {
  load_balancer_arn = aws_lb.webapp_lb.arn
  port              = var.listener_port_https     //443
  protocol          = var.listener_protocol_https //HTTPS
  ssl_policy        = var.ssl_policy              //ELBSecurityPolicy-TLS-1-2-2017-01
  certificate_arn   = var.certificate_arn

  default_action {
    type             = var.listener_action_type //forward
    target_group_arn = aws_lb_target_group.webapp_target_group.arn
  }
}

resource "aws_lb_target_group" "webapp_target_group" {
  name        = "webapp-target-group"
  port        = var.webapp_port            //port of the webapp
  protocol    = var.listener_protocol_http //HTTP
  target_type = "instance"
  vpc_id      = aws_vpc.csye6225.id

  # Health check for the target group
  health_check {
    protocol            = var.listener_protocol_http //HTTP
    path                = var.healthz_path           //"/healthz"              //check the health of the target
    interval            = var.interval               //30
    timeout             = var.timeout                //5
    healthy_threshold   = var.healthy_threshold      //2
    unhealthy_threshold = var.unhealthy_threshold    //2
  }

  tags = {
    Name = "webapp-target-group"
  }
}

