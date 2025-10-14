resource "aws_vpc" "openvpn_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = { Name = "openvpn" }
}

resource "aws_subnet" "openvpn_subnet" {
  vpc_id     = aws_vpc.openvpn_vpc.id
  cidr_block = "10.0.1.0/24"

  tags = { Name = "openvpn" }
}

resource "aws_internet_gateway" "openvpn_igw" {
  vpc_id = aws_vpc.openvpn_vpc.id

  tags = { Name = "openvpn" }
}

resource "aws_route_table" "openvpn_route_table" {
  vpc_id = aws_vpc.openvpn_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.openvpn_igw.id
  }

  route {
    cidr_block = "10.0.0.0/16"
    gateway_id = "local"
  }

  tags = { Name = "openvpn" }
}

resource "aws_route_table_association" "rt_association" {
  subnet_id      = aws_subnet.openvpn_subnet.id
  route_table_id = aws_route_table.openvpn_route_table.id
}
