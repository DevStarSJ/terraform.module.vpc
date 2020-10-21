resource "aws_internet_gateway" "vpc" {
  vpc_id = aws_vpc.vpc.id

  tags = map( "Name", var.name )
}

resource "aws_route" "public" {
	route_table_id         = aws_vpc.vpc.default_route_table_id
	destination_cidr_block = "0.0.0.0/0"
	gateway_id             = aws_internet_gateway.vpc.id
}
