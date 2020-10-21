resource "aws_eip" "private" {
  vpc = true

  tags = { Name = "${var.name}_private" }
}

resource "aws_nat_gateway" "private" {
  allocation_id = aws_eip.private.id
  subnet_id     = aws_subnet.public[var.zones[0]].id

  tags = { Name = "${var.name}_private" }
}

resource "aws_route" "private" {
	route_table_id         = aws_route_table.private.id
	destination_cidr_block = "0.0.0.0/0"
	nat_gateway_id         = aws_nat_gateway.private.id
}
