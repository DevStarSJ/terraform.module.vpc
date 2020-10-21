resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = map(
      "Name", var.name,
      "kubernetes.io/cluster/${var.eks_name}", "shared",
  )
}

output "vpc_id" { value = aws_vpc.vpc.id }
