resource "aws_eip" "openvpn_eip" {
  domain   = "vpc"
  instance = aws_instance.openvpn_server.id
}

output "openvpn_public_ip" {
  value = aws_eip.openvpn_eip.public_ip
}
