resource "aws_instance" "openvpn_server" {
  ami                    = var.ami
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.openvpn_sg.id]
  key_name               = aws_key_pair.openvpn_kp.key_name
  tags = {
    Name = "my-vpn"
  }
}
