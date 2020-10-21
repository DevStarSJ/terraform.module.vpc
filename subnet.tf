resource "aws_subnet" "public" {
  for_each = zipmap(var.zones, var.public_cidrs)

	vpc_id            = aws_vpc.vpc.id
	cidr_block        = each.value
	availability_zone = "${var.region}${each.key}"

	tags = map(
			"Name", "${var.name}_public_${each.key}",
			"kubernetes.io/cluster/${var.eks_name}", "shared",
		)
}

resource "aws_subnet" "private" {
  for_each = zipmap(var.zones, var.private_cidrs)

	vpc_id            = aws_vpc.vpc.id
	cidr_block        = each.value
	availability_zone = "${var.region}${each.key}"

	tags = map(
			"Name", "${var.name}_private_${each.key}",
			"kubernetes.io/cluster/${var.eks_name}", "shared",
		)
}

output "public_subnet_ids" {
  value = [for s in aws_subnet.public: s.id]
}

output "private_subnet_ids" {
  value = [for s in aws_subnet.private: s.id]
}
