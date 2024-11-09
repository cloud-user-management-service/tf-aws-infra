resource "aws_autoscaling_policy" "webapp_scale_up_policy" {
  name                   = "scale-up-policy"
  scaling_adjustment     = var.scaling_adjustment_up_number
  adjustment_type        = var.scaling_adjustment_type //"ChangeInCapacity"
  cooldown               = var.cooldown_period
  autoscaling_group_name = aws_autoscaling_group.webapp_asg.name

  metric_aggregation_type = "Average"
}

resource "aws_autoscaling_policy" "webapp_scale_down_policy" {
  name                   = "scale-down-policy"
  scaling_adjustment     = var.scaling_adjustment_down_number
  adjustment_type        = var.scaling_adjustment_type //"ChangeInCapacity"
  cooldown               = var.cooldown_period
  autoscaling_group_name = aws_autoscaling_group.webapp_asg.name

  metric_aggregation_type = "Average"
}

# CloudWatch Alarm for Scale Up (CPU > 5%)
resource "aws_cloudwatch_metric_alarm" "scale_up_alarm" {
  alarm_name          = "scale_up_alarm"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = var.scale_evaluation_periods //2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = var.scale_period //120
  statistic           = "Average"
  threshold           = var.threshold_up //5
  alarm_actions       = [aws_autoscaling_policy.webapp_scale_up_policy.arn]
  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.webapp_asg.name
  }

  alarm_description = "This metric monitors the CPU usage of the EC2 instances. If the average CPU usage is greater than 5% for 2 consecutive periods of 2 minutes, then the alarm will trigger the scaling up policy."

}

# CloudWatch Alarm for Scale Down (CPU < 3%)
resource "aws_cloudwatch_metric_alarm" "scale_down_alarm" {
  alarm_name          = "scale_down_alarm"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = var.scale_evaluation_periods //2        
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = var.scale_period //120
  statistic           = "Average"
  threshold           = var.threshold_down //30--3
  alarm_actions       = [aws_autoscaling_policy.webapp_scale_down_policy.arn]
  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.webapp_asg.name
  }

  alarm_description = "This metric monitors the CPU usage of the EC2 instances. If the average CPU usage is less than 3% for 2 consecutive periods of 2 minutes, then the alarm will trigger the scaling down policy."

}

