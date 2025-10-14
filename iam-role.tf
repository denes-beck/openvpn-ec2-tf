data "aws_caller_identity" "current" {}

resource "aws_iam_role" "openvpn_role" {
  name = "openvpn-ec2-switch-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        "Effect" : "Allow",
        "Principal" : {
          "Service" : "scheduler.amazonaws.com"
        },
        "Action" : "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy" "openvpn_ec2_policy" {
  name = "openvpn-ec2-policy"
  role = aws_iam_role.openvpn_role.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "ec2:StartInstances",
          "ec2:StopInstances"
        ]
        Resource = "arn:aws:ec2:${var.region}:${data.aws_caller_identity.current.account_id
        }:instance/${aws_instance.openvpn_server.id}"
      }
    ]
  })
}
