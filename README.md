# terraform.module.vpc
Terraform Module VPC for EKS


## Usage Example

- main.tf
```HCL
provider "aws" {
  region = var.region
}

module "vpc" {
  source = "github.com/genoplan/terraform.module.vpc"

  region         = var.region
  name           = var.vpc_name
  eks_name       = var.eks_name

  vpc_cidr       = var.vpc_cidr

  zones          = var.zones
  public_cidrs   = var.public_cidrs 
  private_cidrs  = var.private_cidrs 
}
```

- variable.tf
```HCL
variable "region" { }
variable "vpc_name" { }
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
```

- variable.tfvars
```python
region   = "ap-northeast-2"
vpc_name = "example"
eks_name = "eks-example"

vpc_cidr = "10.0.0.0/16"
zones = ["a", "c", "d"]
public_cidrs = ["0.0.0.0/20", "0.0.16.0/20", "0.0.32.0/20"]
private_cidrs = ["0.0.48.0/20", "0.0.64.0/20", "0.0.80.0/20"]
```

```bash
> terraform plan -var-file=variable.tfvars
```