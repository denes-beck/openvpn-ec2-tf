resource "aws_key_pair" "openvpn_kp" {
  key_name   = "openvpn_kp"
  public_key = file("~/.ssh/id_rsa.pub")
}