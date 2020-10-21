resource "aws_default_route_table" "default" {
  default_route_table_id = aws_vpc.vpc.default_route_table_id

  tags = { Name = "${var.name}_public" }
}

resource "aws_route_table_association" "public" {
  for_each = zipmap(var.zones, var.zones)

	subnet_id      = aws_subnet.public[each.key].id
	route_table_id = aws_vpc.vpc.default_route_table_id
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.vpc.id

  tags = { Name = "${var.name}_private" }
}

resource "aws_route_table_association" "private" {
  for_each = zipmap(var.zones, var.zones)

	subnet_id      = aws_subnet.private[each.key].id
	route_table_id = aws_route_table.private.id
}
