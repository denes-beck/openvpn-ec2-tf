resource "aws_instance" "openvpn_server" {
  ami                    = var.ami
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.openvpn_sg.id]
  key_name               = aws_key_pair.openvpn_kp.key_name
  instance_market_options {
    market_type = "spot"
    spot_options {
      max_price = 0.015
    }
  }
  tags = {
    Name = "my-vpn"
  }
}
