resource "aws_autoscaling_group" "webapp_asg" {
  name                = "webapp_asg"
  desired_capacity    = var.desired_capacity
  min_size            = var.min_size
  max_size            = var.max_size
  vpc_zone_identifier = [aws_subnet.csye6225_private_subnet_1.id, aws_subnet.csye6225_private_subnet_2.id]

  launch_template {
    id      = aws_launch_template.webapp_launch_template.id
    version = "$Latest"
  }

  health_check_type         = "ELB"
  health_check_grace_period = var.health_check_grace_period //300
  termination_policies      = ["OldestInstance"]


  target_group_arns = [aws_lb_target_group.webapp_target_group.arn]


  // Tags for the AutoScaling Group
  tag {
    key                 = var.tag_key
    value               = var.tag_value
    propagate_at_launch = true
  }
}
