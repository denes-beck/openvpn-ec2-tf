resource "aws_scheduler_schedule" "openvpn_scheduler_on" {
  name        = "openvpn_on"
  description = "Turn on OpenVPN server"
  group_name  = "default"
  flexible_time_window {
    mode = "OFF"
  }
  schedule_expression_timezone = var.timezone
  schedule_expression          = "cron(0 7 * * ? *)"

  target {
    arn      = "arn:aws:scheduler:::aws-sdk:ec2:startInstances"
    input    = "{\n  \"InstanceIds\": [\n    \"${aws_instance.openvpn_server.id}\"\n  ]\n}"
    role_arn = aws_iam_role.openvpn_role.arn
    retry_policy {
      maximum_event_age_in_seconds = 1800
      maximum_retry_attempts       = 3
    }
  }
}

resource "aws_scheduler_schedule" "openvpn_scheduler_off" {
  name        = "openvpn_off"
  description = "Turn off OpenVPN server"
  group_name  = "default"
  flexible_time_window {
    mode = "OFF"
  }
  schedule_expression_timezone = var.timezone
  schedule_expression          = "cron(0 22 * * ? *)"

  target {
    arn      = "arn:aws:scheduler:::aws-sdk:ec2:stopInstances"
    input    = "{\n  \"InstanceIds\": [\n    \"${aws_instance.openvpn_server.id}\"\n  ]\n}"
    role_arn = aws_iam_role.openvpn_role.arn
    retry_policy {
      maximum_event_age_in_seconds = 1800
      maximum_retry_attempts       = 3
    }
  }
}
