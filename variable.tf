variable "region" { }
variable "name" { }
variable "eks_name" { }
variable "vpc_cidr" { }
variable "zones" { 
  type = list(string)
  default = []
}
variable "public_cidrs" { 
  type = list(string)
  default = []
}
variable "private_cidrs" { 
  type = list(string)
  default = []
}