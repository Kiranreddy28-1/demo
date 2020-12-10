resource "aws_internet_gateway" "default" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "gateway for public"
  }
}
resource "aws_route_table" "route1" {
    vpc_id = aws_vpc.main.id

    route {
        cidr_block = "0.0.0.0/16"
        gateway_id = aws_internet_gateway.default.id
    }
    tags = {
        Name = "IG_route_table"
    }
}
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.Bastion_subnet.id
  route_table_id = aws_route_table.route1.id
}